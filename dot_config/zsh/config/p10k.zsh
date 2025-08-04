# Powerlevel10k Configuration
# To reconfigure, run: p10k configure

# Set Powerlevel10k configuration file location (XDG compliant)
export POWERLEVEL10K_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/p10k.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source the main p10k configuration (XDG compliant)
P10K_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/p10k.zsh"
[[ ! -f "$P10K_CONFIG" ]] || source "$P10K_CONFIG"

# Fallback to legacy location for compatibility
[[ ! -f "$P10K_CONFIG" ]] && [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh