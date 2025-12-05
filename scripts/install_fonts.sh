#!/bin/bash

set -euo pipefail

# Load print functions
source "scripts/print.sh"

install_fonts() {
    warning "Installing fonts..."

    # macOS font directory
    local fonts_dir="$HOME/Library/Fonts"
    mkdir -p "$fonts_dir"

    # List of fonts to install.
    # Format: "Font Name;Font Filename;Download URL"
    local fonts_to_install=(
        "Hack Nerd Font;HackNerdFont-Regular.ttf;https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/HackNerdFont-Regular.ttf"
    )

    for font_data in "${fonts_to_install[@]}"; do
        IFS=';' read -r font_name font_file font_url <<<"$font_data"
        local font_dest="$fonts_dir/$font_file"

        if [ -f "$font_dest" ]; then
            info "$font_name is already installed."
        else
            info "Downloading $font_name..."
            if curl -fLo "$font_dest" --create-dirs "$font_url"; then
                success "$font_name installed successfully."
            else
                error "Failed to download $font_name."
            fi
        fi
    done
}

# Run font installation
install_fonts
