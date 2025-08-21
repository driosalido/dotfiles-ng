# Zsh Completion System Configuration

# Fix insecure directories warning for macOS with Homebrew
# This is common when using Homebrew-installed zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Check and fix permissions on common problematic directories
    for dir in /usr/local/share/zsh /usr/local/share/zsh/site-functions \
               /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions; do
        if [[ -d "$dir" && -w "$dir" ]]; then
            # Only fix if we own the directory
            if [[ -O "$dir" ]]; then
                chmod 755 "$dir" 2>/dev/null || true
            fi
        fi
    done
fi

# Initialize completion system
autoload -Uz compinit
# Use -u flag to skip security check if still having issues
# Remove -u if you want strict security checking
compinit -u -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Completion options
setopt COMPLETE_IN_WORD     # Complete from both ends of a word
setopt ALWAYS_TO_END        # Move cursor to the end of a completed word
setopt PATH_DIRS            # Perform path search even on command names with slashes
setopt AUTO_MENU            # Show completion menu on successive tab press
setopt AUTO_LIST            # Automatically list choices on ambiguous completion
setopt AUTO_PARAM_SLASH     # If completed parameter is a directory, add a trailing slash
setopt COMPLETE_ALIASES     # Complete aliases

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'

# Cache completions
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"