# Dotfiles

Personal dotfiles configuration managed with [chezmoi](https://chezmoi.io/). Cross-platform support for macOS and Linux with automatic tool installation and XDG Base Directory compliance.

## Features

- 🍎 **Cross-platform**: Works on macOS (Intel & Apple Silicon) and Linux
- 🚀 **One-liner installation**: No prompts, just works with smart defaults
- 📁 **XDG compliant**: Follows XDG Base Directory Specification
- 🎨 **Modern shell**: Advanced zsh with autocompletion, suggestions, and syntax highlighting
- ⚡ **Modern CLI tools**: fzf (fuzzy search), zoxide (smart cd), ripgrep, fd, bat, eza, delta
- 🔧 **Package management**: Automatic Homebrew installation with curated package list
- 🎯 **Productivity features**: FZF integration (Ctrl+R history, Ctrl+T files, Alt+C dirs)
- 📝 **Development ready**: Git configuration, neovim, and development tools
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
1. 🍺 **Install Homebrew** (if not present) for package management
2. 📦 **Install essential packages**: git, fzf, zoxide, ripgrep, fd, bat, eza, delta, htop, neovim, tmux, and more
3. 🔤 **Install MesloLGS Nerd Font** for Powerlevel10k icons and symbols
4. 🏠 **Configure shell environment**: 
   - Oh-My-Zsh with Powerlevel10k theme
   - zsh-autosuggestions (green suggestions as you type)
   - zsh-syntax-highlighting (command coloring)
   - Advanced autocompletion with menus and colors
   - FZF integration for fuzzy searching
5. ⚙️ **Configure development tools**: Git with delta diffs, global gitignore, and aliases

## Post-Installation

1. **Restart your terminal** for all changes to take effect
2. **Configure your terminal font** to "MesloLGS NF" for proper icons
3. **Run `p10k configure`** if you want to customize the prompt

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

## Key Features & Usage

### Modern Shell Experience
- **Smart suggestions**: Type any command and see green suggestions from your history
- **Fuzzy search**: Press `Ctrl+R` for history search, `Ctrl+T` for file search, `Alt+C` for directory navigation
- **Smart navigation**: Use `z <directory>` to jump to frequently used directories
- **Better commands**: `ls` → `eza` (with icons), `cat` → `bat` (with syntax highlighting), `find` → `fd`, `grep` → `ripgrep`

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

## Troubleshooting

### Installation Issues

If you encounter any issues during installation:

1. **Clean install**:
```bash
rm -rf ~/.local/share/chezmoi ~/.config/chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng
```

2. **Check prerequisites**: Ensure Command Line Tools are installed on macOS

### Common Issues

**Font icons not showing correctly:**
1. Set your terminal font to "MesloLGS NF"
2. Restart your terminal after font installation
3. Run `p10k configure` if icons still don't appear

**Autosuggestions not visible:**
- They appear in green as you type
- Press `→` (right arrow) to accept the full suggestion
- Press `Ctrl+→` to accept just one word

**FZF not working with Ctrl+R:**
- Make sure you've restarted your terminal after installation
- The interface should show a searchable history when you press Ctrl+R

## What's Next

This configuration provides a solid foundation. Planned features include:
- Corporate vs Personal environment detection
- Bitwarden CLI / macOS Keychain integration for secrets management
- SSH configuration with XDG compliance
- Development environment setup (Python, Node.js)
- Additional modern CLI tools (lazygit, bottom, etc.)

## Contributing

Feel free to fork and adapt this configuration for your needs. The modular structure makes it easy to add or remove components.