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

    # Optional: Show direnv status in prompt (if not using p10k segment)
    # This is handled better by p10k if you're using it
fi