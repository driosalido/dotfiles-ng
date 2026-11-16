# Catppuccin Mocha everywhere (Ghostty, Starship, fzf, bat, delta, eza, k9s, lazygit, atuin, yazi).

# bat: fixed Mocha (auto dark/light detection fails when bat isn't on a tty, e.g. as MANPAGER).
# delta: syntax-theme in the git config.
export BAT_THEME="Catppuccin Mocha"

# eza reads $EZA_CONFIG_DIR/theme.yml (default on macOS would be ~/Library/...)
export EZA_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eza"

# lazygit: base config + Catppuccin theme (chezmoi external)
export LG_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/config.yml,${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/catppuccin-mocha.yml"

# eza: Nerd Font icons whenever output is a terminal (ls, ll, la, lt, fzf previews)
export EZA_ICONS_AUTO=1

# man pages rendered by bat (coloured, Catppuccin); `help <cmd>` does the same for --help
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# difftastic (git dft / git dlog) on a dark background
export DFT_BACKGROUND=dark
