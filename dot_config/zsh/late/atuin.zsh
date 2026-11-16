# atuin owns Ctrl-R (loaded after fzf, before zsh-syntax-highlighting).
# Up arrow is left to zsh's prefix search (frameworks/core.zsh).
if (( $+commands[atuin] )); then
  _f="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/atuin-init.zsh"
  if [[ ! -s $_f || $commands[atuin] -nt $_f ]]; then
    mkdir -p ${_f:h} && atuin init zsh --disable-up-arrow >| $_f
  fi
  source $_f
  unset _f
fi
