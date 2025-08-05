#!/bin/bash

# Install chezmoi if not already installed
if ! command -v chezmoi &> /dev/null; then
    echo "Installing chezmoi..."
    
    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS
        if command -v brew &> /dev/null; then
            brew install chezmoi
        else
            curl -sfL https://git.io/chezmoi | sh -s -- -b "$HOME/.local/bin"
        fi
    elif [[ "$(uname)" == "Linux" ]]; then
        # Linux
        curl -sfL https://git.io/chezmoi | sh -s -- -b "$HOME/.local/bin"
    fi
    
    echo "chezmoi installed successfully"
else
    echo "chezmoi is already installed"
fi