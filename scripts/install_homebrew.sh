#!/bin/bash

set -euo pipefail

# Load print functions
source "$(dirname "$0")/print.sh"

install_homebrew() {
    if command -v brew &>/dev/null; then
        print_message "$CYAN" "✅ Homebrew is already installed."
    else
        print_message "$YELLOW" "🚀 Installing Homebrew..."
        NONINTERACTIVE=1 /bin/bash -c \
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH (for Apple Silicon and Intel Macs)
        if [[ -d /opt/homebrew/bin ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -d /usr/local/bin ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi

        print_message "$GREEN" "✅ Homebrew installed successfully."
    fi
}

# Run install
install_homebrew
