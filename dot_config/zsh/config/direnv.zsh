# Direnv configuration for automatic environment loading
# https://direnv.net/

# Check if direnv is installed
if command -v direnv &> /dev/null; then
    # Hook direnv into zsh
    eval "$(direnv hook zsh)"

    # Optional: Customize direnv behavior
    export DIRENV_LOG_FORMAT=""  # Make direnv less verbose

    # Optional: Add custom direnv commands
    alias da='direnv allow'
    alias dr='direnv reload'
    alias ds='direnv status'
    alias de='direnv edit'

    # direnv status is shown by the Starship prompt
fi