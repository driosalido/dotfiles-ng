# Zsh History Configuration (XDG compliant)

# History file location
HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

# History settings
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt APPEND_HISTORY         # Append to history file
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_VERIFY            # Show command with history expansion to user before running
setopt INC_APPEND_HISTORY     # Add commands immediately, not just when shell exits