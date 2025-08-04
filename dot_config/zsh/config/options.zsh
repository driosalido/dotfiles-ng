# Zsh Options Configuration

# Directory navigation
setopt AUTO_CD              # Change directory just by typing dirname
setopt AUTO_PUSHD           # Make cd push old directory onto directory stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicate directories
setopt PUSHD_MINUS          # Exchange meanings of '+' and '-' when used with a number to specify a directory in the stack

# Globbing
setopt EXTENDED_GLOB        # Use extended globbing syntax
setopt GLOB_DOTS            # Include dotfiles in globbing
setopt NO_CASE_GLOB         # Case insensitive globbing
setopt NUMERIC_GLOB_SORT    # Sort globs numerically when possible

# Correction
setopt CORRECT              # Auto correct mistakes
setopt CORRECT_ALL          # Auto correct all arguments in line

# Miscellaneous
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
setopt NO_BEEP              # Don't beep on errors
setopt MULTIOS              # Perform implicit tees or cats when multiple redirections are attempted