#!/bin/bash

set -euo pipefail

# Load print functions
source "scripts/print.sh"

setup_shell() {
    warning "Setting up shell environment..."

    # Check if zsh is already the default shell
    if [[ "$SHELL" == *"zsh" ]]; then
        success "Zsh is already your default shell."
        return 0
    fi

    # Ensure zsh is installed
    if ! command -v zsh &>/dev/null; then
        error "Zsh is not installed. Please install zsh first."
        return 1
    fi

    local zsh_path
    zsh_path="$(command -v zsh)"

    # Add zsh to the list of valid shells if not present
    if ! grep -Fxq "$zsh_path" /etc/shells; then
        info "Adding $zsh_path to /etc/shells..."
        if ! echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null; then
            error "Failed to add zsh to /etc/shells. Please check your sudo permissions."
            return 1
        fi
    fi

    info "Changing default shell to zsh..."
    if chsh -s "$zsh_path"; then
        success "Default shell changed to zsh. Please restart your terminal for the change to take effect."
    else
        error "Failed to change default shell. Please try running 'chsh -s $zsh_path' manually."
        return 1
    fi
}

# Run shell setup
setup_shell
