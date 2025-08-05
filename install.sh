#!/usr/bin/env bash
# Dotfiles installation script with interactive prompts

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

# Header
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Dotfiles Installation Script  ${NC}"
echo -e "${BLUE}================================${NC}"
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

# Collect user information
print_info "Please answer the following questions:"
echo

# Email
read -p "Enter your email address: " email </dev/tty
while [[ -z "$email" ]] || [[ ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; do
    if [[ -n "$email" ]]; then
        print_error "Invalid email format"
    fi
    read -p "Enter your email address: " email </dev/tty
done

# Personal or corporate
echo
read -p "Is this a personal computer? (y/N): " is_personal </dev/tty
if [[ "$is_personal" =~ ^[Yy]$ ]]; then
    is_personal="true"
else
    is_personal="false"
fi

# Use secrets
echo
read -p "Do you want to use secrets management (1Password, etc.)? (y/N): " use_secrets </dev/tty
if [[ "$use_secrets" =~ ^[Yy]$ ]]; then
    use_secrets="true"
else
    use_secrets="false"
fi

# Create chezmoi config
print_info "Creating chezmoi configuration..."
mkdir -p ~/.config/chezmoi

cat > ~/.config/chezmoi/chezmoi.toml << EOF
[data]
    email = "$email"
    is_personal = $is_personal
    use_secrets = $use_secrets
EOF

print_success "Configuration created!"

# Initialize and apply dotfiles
echo
print_info "Initializing dotfiles..."
chezmoi init driosalido/dotfiles-ng

print_info "Applying dotfiles..."
chezmoi apply

echo
print_success "Dotfiles installation complete!"
echo
print_info "Next steps:"
echo "  1. Restart your terminal"
echo "  2. Set your terminal font to 'MesloLGS NF'"
echo "  3. Run 'p10k configure' to customize your prompt (optional)"
echo
print_info "To update in the future, run: chezmoi update"