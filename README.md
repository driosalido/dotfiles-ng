# Dotfiles

Personal dotfiles configuration managed with [chezmoi](https://chezmoi.io/). Cross-platform support for macOS and Linux with automatic tool installation and XDG Base Directory compliance.

## Features

- 🍎 **Cross-platform**: Works on macOS (Intel & Apple Silicon) and Linux
- 🚀 **One-liner installation**: No prompts, just works with smart defaults
- 📁 **XDG compliant**: Follows XDG Base Directory Specification
- 🎨 **Modern shell**: Modular zsh without a framework: Starship prompt, fzf-tab, autosuggestions, syntax highlighting
- ⚡ **Fast startup**: ~0.1s (cached completions and Starship init, no framework)
- 🛠 **Modern CLI tools**: fzf, zoxide, ripgrep, fd, bat, eza, delta, direnv, atuin
- 🐈 **One theme everywhere**: Catppuccin Mocha in Ghostty, Starship, fzf, bat, delta, eza, k9s, lazygit and atuin
- 👻 **Ghostty config**: Nerd Font, splits, drop-down quick terminal (`Ctrl+\``)
- 🟢 **Node.js via fnm**: auto-switches version on `cd` (`.nvmrc` / `.node-version`)
- 🔧 **Package management**: Automatic Homebrew installation with curated package list
- 🔒 **Secrets**: Bitwarden + macOS Keychain + direnv, no plain-text secrets in `.envrc` files
- 🗑 **Safe deletes**: `rm` moves files to the macOS Trash

## Prerequisites

- **macOS**: Command Line Tools (`xcode-select --install`)
- **Linux**: `curl` or `wget` installed

## Quick Install

### One-liner Installation (Recommended)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng
```

This will:
- Install chezmoi automatically
- Apply all dotfiles configurations
- Install Homebrew and packages
- Set up the complete development environment

### Alternative Installation

```bash
# Install chezmoi first
brew install chezmoi            # or: sh -c "$(curl -fsLS get.chezmoi.io)"

# Then apply dotfiles
chezmoi init --apply driosalido/dotfiles-ng
```

## What Gets Installed

First run will:
1. 🍺 **Install Homebrew** (if not present) for package management
2. 📦 **Install packages** from the Brewfile: git, gh, fzf, zoxide, ripgrep, fd, bat, eza, delta, htop, neovim, tmux, direnv, fnm, bitwarden-cli, gcloud and more (on Fedora, packages come from `dnf`)
3. 🔤 **Install MesloLGS Nerd Font** for prompt icons and symbols
4. 🏠 **Configure shell environment**:
   - Starship prompt (two lines, transient prompt, git/kube/gcloud context)
   - fzf-tab (Tab completion menu in fzf, with previews)
   - zsh-autosuggestions (green suggestions as you type)
   - zsh-syntax-highlighting (command coloring)
   - Advanced autocompletion with menus and colors
   - FZF integration for fuzzy searching
5. ⚙️ **Configure development tools**: Git config and global gitignore, gh, neovim, direnv
6. 🍏 **Apply macOS settings** (Finder and system defaults, `run_once_macos-settings.sh`)

## Post-Installation

1. **Restart your terminal** for all changes to take effect
2. **Configure your terminal font** to "MesloLGS NF" for proper icons
3. **Customize the prompt** in `~/.config/starship.toml` (managed as `dot_config/starship.toml.tmpl`).
   Machine-local kube context rules (e.g. work clusters) go in the unmanaged
   `~/.config/starship/contexts.local.toml`, included on `chezmoi apply`
4. **Secrets** (optional): `bw login` and `secrets sync` (see [Secrets](#secrets))

## Customization

The installation uses smart defaults:
- **Email**: Auto-detected from your git config
- **Environment**: Defaults to personal computer
- **Secrets**: Enabled by default (Bitwarden CLI + macOS Keychain; 1Password is deprecated)

To customize, set environment variables before installation:
```bash
# For corporate environment
export DOTFILES_PERSONAL=false

# Disable secrets management
export DOTFILES_USE_SECRETS=false

# Override email
export GIT_AUTHOR_EMAIL="work@company.com"

# Then install
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng
```

## Shell Layout

`~/.zshrc` only sources `~/.config/zsh/zshrc`, which loads the modules in this order:

| Directory | Contents |
|---|---|
| `bootstrap/` | Homebrew, XDG base dirs |
| `config/` | completion styles, history, options, direnv |
| `frameworks/` | `core.zsh`: `compinit`, key bindings, fzf-tab, autosuggestions, Starship, terminal title |
| `env/` | exports and PATH (deduplicated), Node via fnm, LM Studio |
| `ui/` | aliases, functions, fzf, zoxide, gcloud, kubectl |
| `local/` | machine-specific overrides (not shared) |
| `late/` | zsh-syntax-highlighting (must load after every widget) |

Installers that append lines to `~/.zshrc` should have them moved into a module.

## Key Features & Usage

### Modern Shell Experience
- **Smart suggestions**: Type any command and see green suggestions from your history
- **History search**: `Ctrl+R` opens atuin (fuzzy, filter by directory/repo/session, exit codes); `Ctrl+R` again cycles filters; Enter puts the command on the line
- **Fuzzy search**: `Ctrl+T` files, `Alt+C` directories (fzf)
- **Smart navigation**: `z <directory>` jumps to frequently used directories
- **Better commands**: `ls`/`ll`/`la`/`lt` → `eza`, `cat` → `bat`, `kubectl`/`k` → `kubecolor`
- **Git aliases**: in the git config (`git st`, `git co`, `git cleanup`…)
- **Safe deletes**: `rm` moves files to the Trash (`rm -rf` works); real removal: `command rm`
- **Prompt**: git branch/status (also in repos with relative worktrees; `(wt)` marks a
  linked worktree), kube context and gcloud project (prod in red), transient prompt
- **Tab completion**: fzf menu with previews (fzf-tab); `**<Tab>` still does fzf file search
- **`ls`** → eza, translating `ls` sort flags (`-t`, `-S`, `-r`, `-tc`, `-tu`); real ls: `command ls`
- **Node.js**: `fnm install <ver>`, `fnm default <ver>`; switches automatically on `cd`

### Daily Workflow
```bash
# Update your dotfiles
chezmoi update

# Add a new file to management
chezmoi add ~/.gitconfig

# Edit a managed file
chezmoi edit ~/.zshrc

# View what would change
chezmoi diff

# Apply changes
chezmoi apply
```

The zsh plugins and Starship come from Homebrew (`brew upgrade`) or dnf on Fedora;
fzf-tab on Linux is a chezmoi external (`chezmoi apply -R` to refresh).

## Secrets

Project secrets live in Bitwarden (source of truth), cached in the macOS Keychain and loaded
by direnv with `use keychain_env <name>`. CLI: `secrets`. Full guide:
[docs/secrets.md](docs/secrets.md).

## Troubleshooting

### Installation Issues

If you encounter any issues during installation:

1. **Clean install** (first push or back up any local changes in `~/.local/share/chezmoi`;
   this deletes them):
```bash
rm -rf ~/.local/share/chezmoi ~/.config/chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng
```

2. **Check prerequisites**: Ensure Command Line Tools are installed on macOS

### Common Issues

**Font icons not showing correctly:**
1. Set your terminal font to a Nerd Font ("MesloLGS Nerd Font" / "MesloLGS NF")
2. Restart your terminal after font installation

**Autosuggestions not visible:**
- They appear in green as you type
- Press `→` (right arrow) to accept the full suggestion
- Press `Ctrl+→` to accept just one word

**FZF not working with Ctrl+R:**
- Make sure you've restarted your terminal after installation
- The interface should show a searchable history when you press Ctrl+R

**Completion missing for a newly installed tool:**
- The completion dump rebuilds automatically when an `fpath` directory changes; to force it:
  `rm ~/.cache/zsh/zcompdump-*` and open a new shell

**Slow shell startup:**
- Measure with `for i in 1 2 3; do /usr/bin/time zsh -lic exit; done` (expected ~0.1s)
- Prompt modules: `starship timings`

## What's Next

See [ROADMAP.md](ROADMAP.md). Highlights:
- Corporate vs Personal environment detection
- Linux support for `keychain_env` secrets
- SSH configuration with XDG compliance
- Python environment setup
- Additional modern CLI tools (lazygit, bottom, etc.)

## Contributing

Feel free to fork and adapt this configuration for your needs. The modular structure makes it easy to add or remove components.
