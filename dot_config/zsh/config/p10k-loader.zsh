# Powerlevel10k configuration loader (XDG compliant)
# Instant prompt is enabled at the top of ~/.config/zsh/zshrc.
# To reconfigure, run: p10k configure  (then: chezmoi re-add ~/.config/p10k.zsh)

# Managed by chezmoi as dot_config/p10k.zsh
[[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/p10k.zsh" ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/p10k.zsh"
