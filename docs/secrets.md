# Secrets: Bitwarden + macOS Keychain + direnv

How project secrets (tokens, API keys, passwords) are stored and loaded without keeping
them in plain text in `.envrc` files.

> 1Password is deprecated and not used.

## Quick start

**1. Day to day: nothing to do.** When you enter the project, direnv loads the secrets.

```bash
cd ~/code/myproject
```

**2. Change, add or rotate a secret**

```bash
export BW_SESSION=$(bw unlock --raw)   # master password (once per terminal)
secrets edit myproject                # opens $EDITOR → change → save
direnv reload                          # reload variables in the current terminal
```

**3. New Mac, or lost cache**

```bash
export BW_SESSION=$(bw login --raw)    # or "bw unlock --raw" if already logged in
secrets sync                           # download every envrc:* note into the Keychain
```

**If something fails**

| Message | Fix |
|---|---|
| `no Keychain cache for envrc:X` | `secrets sync X` |
| `invalid_grant` or `unauthenticated` | `export BW_SESSION=$(bw login --raw)` |
| Which notes exist? | `secrets list` |

**In an `.envrc`:** `use keychain_env <name>` at the top; below it, only non-secret variables.

## How it works

```
Bitwarden / Vaultwarden              macOS Keychain                    direnv
secure note "envrc:<name>"  ──sync──▶  cache "envrc:<name>#N"  ──▶  .envrc: use keychain_env <name>
(source of truth, synced              (local, no unlock needed)        (exports the variables when
 across machines)                                                       you enter the directory)
```

- **Bitwarden** is the source of truth. Each project has an item named `envrc:<name>`
  (legacy `ws/<name>` items also work) whose notes are env lines: `export VAR="value"`
  (shell) or `VAR=value` (dotenv-style).
- **Attachments**: item fields named `file:<attachment name>` whose value is a path
  (e.g. `~/.config/foo/key.pem`) make `secrets sync` download that attachment there (mode 600).
- **The macOS Keychain** holds a local copy. direnv reads it when you enter the directory,
  so day to day **you never unlock Bitwarden**.
- **The `.envrc`** only has non-secret variables (URLs, IDs, users) plus a
  `use keychain_env <name>` line. It no longer contains secrets and is safe to sync or version.

Pieces (managed by chezmoi):

| File | What it is |
|---|---|
| `~/.local/bin/secrets` | CLI to manage secrets (`dot_local/bin/executable_secrets`) |
| `~/.config/direnv/direnvrc` | Defines `use keychain_env` for direnv (`dot_config/direnv/direnvrc`) |
| `bitwarden-cli` in the Brewfile | The `bw` command |

Third-party pieces it builds on: a Bitwarden-compatible server (Bitwarden or a self-hosted
Vaultwarden), the Bitwarden CLI, the macOS Keychain (`security`) and direnv.

## Commands

| Command | What it does | Needs Bitwarden? |
|---|---|---|
| `secrets edit <name>` | Opens the note in `$EDITOR`, checks syntax, saves to Bitwarden and the Keychain | Yes |
| `secrets sync [name...]` | Copies Bitwarden → Keychain (all `envrc:*` notes if no name) | Yes |
| `secrets push <name> <file>` | Creates/updates the note from a file, then syncs it | Yes |
| `secrets list` | Lists the `envrc:*` notes in Bitwarden | Yes |
| `secrets env <name>` | Prints `export` lines from the Keychain cache, for `.envrc` or MCP launchers: `eval "$(secrets env <name>)"` (prints secrets!) | No |
| `secrets get <name>` | Prints the cached notes verbatim (prints secrets!) | No |
| `secrets adopt <name>` | Renames a legacy `ws/<name>` item to `envrc:<name>` (keeps attachments) | Yes |
| `secrets forget <name>` | Deletes the Keychain cache (Bitwarden untouched) | No |

Unlocking: commands that talk to Bitwarden run `bw unlock` themselves if there is no
session, asking for the password each time. Export `BW_SESSION` (see quick start) to be
asked only once. First time on a machine:

```bash
bw config server https://<your-vaultwarden-host>   # skip for bitwarden.com
export BW_SESSION=$(bw login --raw)
```

## Recipes

### Rotate a token

1. Generate the new token in the service (GitHub, Cloudflare…).
2. `secrets edit <name>` and replace the value.
3. Revoke the old token in the service.

### Use the secrets on another Mac

```bash
chezmoi apply                         # installs secrets, direnvrc and bw
export BW_SESSION=$(bw login --raw)
secrets sync
```

The `.envrc` files can be synced or committed with the project: since they hold no secrets,
they work as soon as the Keychain cache exists. On Linux there is no macOS Keychain: `use keychain_env` logs an
error and loads nothing (support via `secret-tool` or `bw` is on the roadmap).

### Migrate an `.envrc` with plain-text secrets

1. Move the secret `export` lines to a temp file in a private directory
   (`mktemp -d`, mode `700`).
2. Upload them: `secrets push <name> <file>`.
3. In the `.envrc`, delete those lines and add at the top:
   ```bash
   use keychain_env <name>
   ```
4. `direnv allow` and check the variables load (`env | grep VAR`).
5. Delete the temp file: `rm -P <file>`.
6. If the secrets were exposed (synced, shared, in a log), rotate them.

Load order: `use keychain_env` goes first, so non-secret variables may reference secrets
(`export B=$SECRET`), but not the other way round.

### List what is loaded without showing values

```bash
secrets get myproject | sed -E 's/=.*//'     # variable names only
```

## Troubleshooting

| Symptom | Cause / fix |
|---|---|
| `direnv: error keychain_env: no Keychain cache for envrc:X` | No cache on this machine: `secrets sync X` |
| `bw ... invalid_grant` | The `bw` session expired or was revoked: `bw login --raw` |
| `not logged in to Bitwarden` | `bw login` |
| `no Bitwarden note envrc:X` | The note doesn't exist or has another name: `secrets list` |
| macOS asks for Keychain access | Normal the first time `security` reads an item: click "Always Allow" |
| `secrets edit`: `syntax error; not saved` | Not valid shell (unclosed quote…). Nothing was saved; edit again |

## Implementation details

- **Keychain format:** the note body is base64-encoded and stored in 2000-character chunks
  (`envrc:<name>#0`, `#1`…), because `security -i` truncates long input lines.
- **Values never appear in process arguments** (invisible to `ps`): they are written to the
  Keychain with `security -i` reading from stdin, and sent to Bitwarden via `bw encode`.
- **Temp files** (`edit`, `push`) live in a mode-`700` directory and are removed on exit.
- **`use keychain_env`** evaluates the content as shell (`eval`), exactly as if the lines
  were in the `.envrc`.
