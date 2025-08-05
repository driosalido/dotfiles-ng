#!/usr/bin/env bash
# Uninstall/cleanup script for testing

echo "Cleaning up chezmoi and dotfiles..."

# Remove chezmoi source directory
if [[ -d "$HOME/.local/share/chezmoi" ]]; then
    echo "Removing chezmoi source directory..."
    rm -rf "$HOME/.local/share/chezmoi"
fi

# Remove chezmoi config
if [[ -d "$HOME/.config/chezmoi" ]]; then
    echo "Removing chezmoi config..."
    rm -rf "$HOME/.config/chezmoi"
fi

# Optional: Remove chezmoi state
if [[ -d "$HOME/.local/state/chezmoi" ]]; then
    echo "Removing chezmoi state..."
    rm -rf "$HOME/.local/state/chezmoi"
fi

echo "Cleanup complete!"
echo "You can now run the install script again for a fresh installation."