# Dotfiles

Personal dotfiles configuration managed with [chezmoi](https://chezmoi.io/).

## Installation

```zsh
# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"

# Apply configuration
chezmoi init --apply https://github.com/your-username/dotfiles.git
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