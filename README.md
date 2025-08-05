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

### Interactive Installation (Recommended)

```bash
# Download and run the installation script (with cache bypass)
curl -fsSL "https://raw.githubusercontent.com/driosalido/dotfiles-ng/main/install.sh?$(date +%s)" -o install.sh
chmod +x install.sh
./install.sh
```

Or as a one-liner:
```bash
curl -fsSL "https://raw.githubusercontent.com/driosalido/dotfiles-ng/main/install.sh?$(date +%s)" -o install.sh && chmod +x install.sh && ./install.sh && rm install.sh
```

### Manual Installation (Advanced)

⚠️ **Note**: Due to interactive prompts, the one-liner methods below may not work reliably. Use the interactive installation above for best results.

```bash
# 1. Install chezmoi
curl -sfL https://git.io/chezmoi | sh

# 2. Create config file first
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml << EOF
[data]
    email = "your-email@example.com"
    is_personal = true
    use_secrets = false
EOF

# 3. Initialize and apply dotfiles
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

## Troubleshooting

### Chezmoi exits when typing any key at prompts

This happens when chezmoi can't properly handle interactive input. **Solution** (tested and working):

```bash
# Create config file first (recommended solution)
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml << EOF
[data]
    email = "your-email@example.com"
    is_personal = true
    use_secrets = false
EOF

# Then run init
chezmoi init --apply driosalido/dotfiles-ng
```

⚠️ **Note**: Command-line flags like `--promptString` don't work reliably. Always create the config file first.

### Font icons not showing correctly

Make sure to:
1. Set your terminal font to "MesloLGS NF"
2. Restart your terminal after font installation
3. Run `p10k configure` if icons still don't appear