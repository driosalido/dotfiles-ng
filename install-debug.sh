#!/usr/bin/env bash
# Debug version of installation script

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print colored output
print_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }
print_debug() { echo -e "${YELLOW}[DEBUG]${NC} $1"; }

# Header
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Dotfiles Debug Installation   ${NC}"
echo -e "${BLUE}================================${NC}"
echo

# Pre-fill answers for testing
email="driosalido@gmail.com"
is_personal="true"
use_secrets="true"

print_debug "Using test values:"
print_debug "  email: $email"
print_debug "  is_personal: $is_personal" 
print_debug "  use_secrets: $use_secrets"
echo

# Check if chezmoi is installed
if ! command -v chezmoi &> /dev/null; then
    print_info "Chezmoi not found. Installing chezmoi..."
    
    if [[ "$OSTYPE" == "darwin"* ]] && command -v brew &> /dev/null; then
        brew install chezmoi
    else
        sh -c "$(curl -fsLS get.chezmoi.io)"
        sudo mv ./bin/chezmoi /usr/local/bin/ 2>/dev/null || print_warning "Could not move chezmoi to /usr/local/bin"
    fi
    
    if command -v chezmoi &> /dev/null; then
        print_success "Chezmoi installed successfully!"
    else
        print_error "Failed to install chezmoi"
        exit 1
    fi
else
    print_success "Chezmoi is already installed"
fi

# Debug: Show chezmoi version and config
print_debug "Chezmoi version: $(chezmoi --version)"
print_debug "Chezmoi config dir: $(chezmoi config get config.sourceDir 2>/dev/null || echo 'Not set')"

# Initialize and apply dotfiles
echo
print_info "Initializing dotfiles with debug info..."
print_debug "Running: chezmoi init --apply --promptString email=\"$email\" --promptBool is_personal=$is_personal --promptBool use_secrets=$use_secrets driosalido/dotfiles-ng"

chezmoi init --apply \
  --promptString email="$email" \
  --promptBool is_personal=$is_personal \
  --promptBool use_secrets=$use_secrets \
  driosalido/dotfiles-ng

echo
print_success "Dotfiles installation complete!"

# Debug: Show what was created
print_debug "Checking created files:"
[[ -d ~/.config/chezmoi ]] && print_debug "  ✓ ~/.config/chezmoi exists"
[[ -f ~/.config/chezmoi/chezmoi.toml ]] && print_debug "  ✓ chezmoi.toml exists"
[[ -d ~/.local/share/chezmoi ]] && print_debug "  ✓ chezmoi source dir exists"
[[ -d ~/.config/zsh ]] && print_debug "  ✓ zsh config exists"

echo
print_info "Next steps:"
echo "  1. Restart your terminal"
echo "  2. Set your terminal font to 'MesloLGS NF'"
echo "  3. Run 'p10k configure' to customize your prompt (optional)"