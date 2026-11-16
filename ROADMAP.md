# Dotfiles-NG Roadmap

Planned features for this chezmoi-based dotfiles setup.

## ✅ Completed

### Core Foundation
- [x] **Chezmoi Setup**: Base configuration with templates
- [x] **Platform Detection**: Automatic macOS/Linux detection
- [x] **Git Configuration**: Cross-platform template with personal variables
- [x] **XDG Compliance**: XDG Base Directory Specification
- [x] **One-liner Installation**: Full install with `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng`
- [x] **Smart Defaults**: Email auto-detection, no prompts

### Shell Configuration
- [x] **Basic Shell Config**: zsh only (bash removed)
- [x] **Modular Zsh Configuration**: Modules in `~/.config/zsh/` with a defined load order
- [x] **Oh-My-Zsh Integration**: Automatic install, XDG-compliant
- [x] **Powerlevel10k Theme**: Automatic install with custom configuration (instant prompt at the top of zshrc)
- [x] **Nerd Font Installation**: MesloLGS NF on macOS/Linux
- [x] **Shell Plugins**: zsh-autosuggestions, zsh-syntax-highlighting
- [x] **Cross-platform Aliases**: Common and platform-specific aliases
- [x] **XDG-Compliant P10k Config**: `~/.config/p10k.zsh`, plus a git fallback segment for repos with `extensions.relativeWorktrees`
- [x] **Advanced Autocompletion**: Menu completion with colors, single `compinit` (Oh My Zsh)
- [x] **FZF Integration**: Fuzzy search with Ctrl+R, Ctrl+T, Alt+C (`fzf --zsh`)
- [x] **Modern Tools**: fzf, zoxide, ripgrep, fd, bat, eza, delta
- [x] **Fast Startup**: ~0.15s (cached completions, no subprocesses at startup)

### Package Management
- [x] **Homebrew Integration**: Automatic install and package management
- [x] **Cross-platform Brewfile**: macOS and Linux
- [x] **Package Cleanup**: Deprecated and broken packages removed
- [x] **Cask Applications**: GUI apps (personal/corporate)

### Secrets Management
- [x] **`secrets` CLI**: Bitwarden (source of truth) → macOS Keychain cache → direnv `use keychain_env`. See [docs/secrets.md](docs/secrets.md)
- [x] **Keychain helpers**: `keychain-get` / `keychain-set`
- [x] **1Password removed** (deprecated)

### Node.js Environment
- [x] **fnm**: Replaces nvm; auto-switches on `cd` via `.nvmrc` / `.node-version`

## 🚧 Next (High Priority)

### 1. Environment Detection & Configuration
- [ ] **Corporate vs Personal Detection**
  - Interactive prompt during init
  - Per-environment configuration
  - Proxy variables for corporate environments
  - Separate emails

### 2. Secrets Management
- [ ] **Linux support for `keychain_env`** (`secret-tool` or `bw` directly)
- [ ] **Migrate remaining project `.envrc` files** to `use keychain_env`
- [ ] **SSH keys** integration

### 3. Advanced Package Management
- [ ] **APT Integration (Linux)**
  - Essential package list
  - Automatic repository updates
  - Snap packages support

### 4. Development Environment
- [ ] **Python Environment**
  - pyenv integration
  - pipx installation and configuration
  - Virtual environment management

- [ ] **Node.js Environment**
  - Global npm packages list
  - Yarn configuration

### 5. SSH Configuration
- [ ] **SSH Config Template**
  - Template for ~/.ssh/config (XDG: ~/.config/ssh/config)
  - Host-specific configurations
  - Jump host configurations

- [ ] **SSH Key Management**
  - Automatic SSH key generation
  - SSH agent integration (macOS Keychain)
  - Platform-specific key algorithms

## 🔮 Future (Medium Priority)

### Editor Configuration
- [ ] **Vim/Neovim Config**
  - Basic vim configuration
  - Plugin management
  - Language server integration

- [ ] **VS Code Settings**
  - Settings sync template
  - Extension list management
  - Workspace configurations

### Terminal & Tools
- [ ] **Terminal Emulator Config**
  - Ghostty / Alacritty configuration
  - iTerm2 preferences (macOS)

- [ ] **Additional CLI Tools**
  - lazygit, bottom, broot, dust, glow
  - Advanced tool configurations
  - Custom functions and aliases

### System Preferences
- [ ] **macOS Defaults**
  - System preferences automation
  - Dock and Finder configurations
  - Keyboard and trackpad settings

- [ ] **Linux Desktop Integration**
  - GNOME/KDE settings
  - Desktop environment specific configs

## 🌟 Advanced (Low Priority)

### Automation & Scripts
- [ ] **Dotfiles Maintenance**
  - Update scripts for packages (Oh My Zsh, Powerlevel10k, plugins)
  - Health check commands
  - Backup and restore functionality

### Security & Privacy
- [ ] **GPG Configuration**
  - GPG key management
  - Git signing configuration
  - Encryption preferences

### Monitoring & Observability
- [ ] **System Monitoring**
  - Basic monitoring aliases
  - Log aggregation helpers
  - Performance monitoring tools

### Multi-Machine Sync
- [ ] **Machine-Specific Configurations**
  - Machine profiles (work-laptop, home-desktop, etc.)
  - Conditional feature flags
  - Remote configuration management

## 📋 Implementation Guidelines

### Branch Strategy
- One feature branch per major feature
- Merge to main once fully tested
- Tags for stable versions

### Testing Strategy
- Test as user `testing@localhost` before merging
- Verify on both macOS and Linux when possible
- Document edge cases and solutions

### Documentation
- Update CLAUDE.md with new commands/features
- Keep README.md up to date
- Comment complex templates

## 🎯 Milestones

### Milestone 1: Core Shell Experience (DONE ✅)
- ✅ One-liner installation
- ✅ Advanced shell configuration
- ✅ Modern tools integration
- ✅ Package management

### Milestone 2: Environment Management (CURRENT)
- Corporate/Personal detection
- ✅ Bitwarden / Keychain integration (macOS)
- SSH configuration

### Milestone 3: Development Ready
- Python + Node.js environments (✅ Node via fnm)
- Editor configurations
- Advanced development tools

### Milestone 4: Production Ready
- All core features implemented
- Complete documentation
- Maintenance scripts

---

*This roadmap is a living document, updated as needs and priorities change.*
