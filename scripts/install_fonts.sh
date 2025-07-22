#!/bin/bash

set -euo pipefail

# Load print functions
source "$(dirname "$0")/print.sh"

install_fonts() {
    print_message "$YELLOW" "🔤 Installing fonts..."

    # Create fonts directory if it doesn't exist
    fonts_dir="$HOME/Library/Fonts"
    mkdir -p "$fonts_dir"

    font_name="Hack Nerd Font"
    font_file="HackNerdFont-Regular.ttf"
    font_url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/$font_file"
    font_dest="$fonts_dir/$font_file"

    if [ -f "$font_dest" ]; then
        print_message "$CYAN" "✔️  $font_name is already installed."
    else
        print_message "$CYAN" "⬇️  Downloading $font_name..."
        curl -fLo "$font_dest" --create-dirs "$font_url"
        print_message "$GREEN" "✅ $font_name installed!"
    fi
}

# Run font installation
install_fonts
