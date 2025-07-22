#!/bin/bash

set -euo pipefail

# Load print functions
source "$(dirname "$0")/print.sh"

setup_shell() {
    print_message "$YELLOW" "🐚 Setting up shell environment..."

    # Check if zsh is already the default shell
    if [[ "$SHELL" == *"zsh" ]]; then
        print_message "$CYAN" "✔️  Zsh is already your default shell."
    else
        # Ensure zsh is installed
        if ! command -v zsh &>/dev/null; then
            print_message "$RED" "❌ Zsh is not installed. Please install zsh first."
            exit 1
        fi

        zsh_path="$(command -v zsh)"

        # Add zsh to the list of valid shells if not present
        if ! grep -Fxq "$zsh_path" /etc/shells; then
            print_message "$CYAN" "🔧 Adding $zsh_path to /etc/shells..."
            echo "$zsh_path" | sudo tee -a /etc/shells
        fi

        print_message "$CYAN" "🔁 Changing default shell to zsh..."
        chsh -s "$zsh_path"
        print_message "$GREEN" "✅ Default shell changed to zsh. Please restart your terminal."
    fi
}

# Run shell setup
setup_shell
