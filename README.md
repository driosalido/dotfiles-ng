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

### One-liner Installation

```bash
# Install chezmoi and apply dotfiles in one command
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng
```

### Step-by-step Installation

```bash
# 1. Install chezmoi binary
curl -sfL https://git.io/chezmoi | sh

# 2. Move chezmoi to PATH (if not automatically done)
sudo mv ./bin/chezmoi /usr/local/bin/

# 3. Initialize and apply dotfiles
chezmoi init --apply https://github.com/driosalido/dotfiles-ng.git
```

### Alternative Installation Methods

**macOS with Homebrew** (if already installed):
```bash
brew install chezmoi
chezmoi init --apply driosalido/dotfiles-ng
```

**Linux with package manager**:
```bash
# Ubuntu/Debian
sudo apt install chezmoi

# Arch Linux
sudo pacman -S chezmoi

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

The installation will prompt for:
- Your email address
- Whether this is a personal or corporate machine
- Whether to use secrets management (1Password, etc.)

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