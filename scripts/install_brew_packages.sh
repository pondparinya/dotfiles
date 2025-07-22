#!/bin/bash

set -euo pipefail

# Load print functions
source "$(dirname "$0")/print.sh"

install_brew_packages() {
    print_message "$YELLOW" "📦 Installing brew packages..."

    packages=(
        "git"
        "neovim"
        "fzf"
        "ripgrep"
        "gh"
        "tmux"
        "htop"
        "exa"
        "bat"
        "wget"
        "fd"
    )

    for package in "${packages[@]}"; do
        if brew list "$package" &>/dev/null; then
            print_message "$CYAN" "✔️  $package is already installed."
        else
            print_message "$CYAN" "⏳ Installing $package..."
            brew install "$package"
        fi
    done

    print_message "$GREEN" "✅ All brew packages installed."
}

# Run install
install_brew_packages
