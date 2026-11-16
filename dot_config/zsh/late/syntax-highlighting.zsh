# zsh-syntax-highlighting must be sourced after every widget is defined (fzf, zoxide, ...).
(( $+functions[_zsh_plugin] )) || return 0
_p=$(_zsh_plugin zsh-syntax-highlighting) && source $_p
unset _p
unfunction _zsh_plugin
