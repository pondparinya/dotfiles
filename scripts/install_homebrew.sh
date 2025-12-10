#!/bin/bash

set -euo pipefail

# Load print functions
source "scripts/print.sh"

install_homebrew() {
    if command -v brew &>/dev/null; then
        success "Homebrew is already installed."
        return 0
    fi

    warning "Installing Homebrew..."
    if ! NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        error "Homebrew installation failed."
        return 1
    fi

    # Add Homebrew to PATH
    local brew_path
    if [[ -x "/opt/homebrew/bin/brew" ]]; then
        brew_path="/opt/homebrew/bin/brew"
    elif [[ -x "/usr/local/bin/brew" ]]; then
        brew_path="/usr/local/bin/brew"
    else
        error "Homebrew executable not found after installation."
        return 1
    fi

    eval "$("$brew_path" shellenv)"
    success "Homebrew installed and configured successfully."
}
