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
    ps aux | grep -v grep | grep "$@" -i --color=auto
}

# Get IP address
myip() {
    curl -s http://checkip.amazonaws.com
}

# Create backup of file
backup() {
    cp "$1"{,.bak}
}

# Show PATH in readable format
path() {
    echo "$PATH" | tr ':' '\n' | nl
}

# Show directory sizes
dirsize() {
    du -sh "${1:-.}"/* | sort -hr
}