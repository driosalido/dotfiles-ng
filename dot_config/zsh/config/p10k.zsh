# Powerlevel10k Configuration
# This file will be replaced by the Powerlevel10k configuration wizard on first run
# To reconfigure, run: p10k configure

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/config/p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh