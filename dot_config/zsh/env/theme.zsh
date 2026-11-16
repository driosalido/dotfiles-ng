# Catppuccin everywhere (Mocha = dark, Latte = light where the tool can switch).
# Ghostty follows the macOS appearance on its own (~/.config/ghostty/config).

# bat picks dark/light from the terminal background (delta: syntax-theme in git config)
export BAT_THEME_DARK="Catppuccin Mocha"
export BAT_THEME_LIGHT="Catppuccin Latte"

# eza reads $EZA_CONFIG_DIR/theme.yml (default on macOS would be ~/Library/...)
export EZA_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eza"

# lazygit: base config + Catppuccin theme (chezmoi external)
export LG_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/config.yml,${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/catppuccin-mocha.yml"
