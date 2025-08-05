# Dotfiles

Personal dotfiles configuration managed with [chezmoi](https://chezmoi.io/). Cross-platform support for macOS and Linux with automatic tool installation and XDG Base Directory compliance.

## Features

- 🍎 **Cross-platform**: Works on macOS (Intel & Apple Silicon) and Linux
- 🚀 **Automatic installation**: Homebrew, fonts, and development tools
- 📁 **XDG compliant**: Follows XDG Base Directory Specification
- 🎨 **Modern shell**: Zsh with Oh-My-Zsh and Powerlevel10k theme
- ⚡ **Performance tools**: fzf, zoxide, ripgrep, fd, bat, eza
- 📝 **Neovim**: Configured as default editor with sensible defaults
- 🔒 **Security**: Global gitignore, proper secrets handling

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
curl -sfL https://git.io/chezmoi | sh

# Then apply dotfiles
chezmoi init --apply driosalido/dotfiles-ng
```

## What Gets Installed

First run will:
1. 🍺 Install Homebrew (if not present)
2. 📦 Install packages from Brewfile (git, fzf, neovim, etc.)
3. 🔤 Install MesloLGS Nerd Font for Powerlevel10k
4. ⚙️ Configure shell, git, and development tools

## Post-Installation

1. **Restart your terminal** for all changes to take effect
2. **Configure your terminal font** to "MesloLGS NF" for proper icons
3. **Run `p10k configure`** if you want to customize the prompt

## Customization

The installation uses smart defaults:
- **Email**: Auto-detected from your git config
- **Environment**: Defaults to personal computer
- **Secrets**: Enabled by default (1Password, etc.)

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

## Usage

```zsh
# Add a file
chezmoi add ~/.zshrc

# Edit a file
chezmoi edit ~/.zshrc

# View differences
chezmoi diff

# Apply changes
chezmoi apply
```

## Troubleshooting

### Installation Issues

If you encounter any issues during installation:

1. **Clean install**:
```bash
rm -rf ~/.local/share/chezmoi ~/.config/chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng
```

2. **Check prerequisites**: Ensure Command Line Tools are installed on macOS

### Font icons not showing correctly

Make sure to:
1. Set your terminal font to "MesloLGS NF"
2. Restart your terminal after font installation
3. Run `p10k configure` if icons still don't appear