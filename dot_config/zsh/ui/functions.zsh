# Custom Functions

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick web search
google() {
    open "https://www.google.com/search?q=$*"
}

# Find process by name
psgrep() {
    pgrep -fil "$@"
}

# Get IP address
myip() {
    curl -fsS https://checkip.amazonaws.com
}

# Create backup of file
backup() {
    cp "$1"{,.bak}
}

# Show PATH in readable format
showpath() {
    print -l $path | nl
}

# Show directory sizes
dirsize() {
    du -sh "${1:-.}"/* | sort -hr
}

# Secrets from the macOS Keychain (replacement for 1Password CLI)
#   keychain-set GITHUB_TOKEN        # prompts for the value
#   export GITHUB_TOKEN=$(keychain-get GITHUB_TOKEN)   # e.g. in .envrc
if [[ $OSTYPE == darwin* ]]; then
    keychain-get() {
        security find-generic-password -a "$USER" -s "$1" -w
    }
    keychain-set() {
        security add-generic-password -U -a "$USER" -s "$1" -w
    }
fi
