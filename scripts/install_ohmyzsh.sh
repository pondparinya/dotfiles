#!/bin/bash

set -euo pipefail

source "scripts/print.sh"

# --- Configuration ---
OH_MY_ZSH_DEST="$HOME/.oh-my-zsh"
ZSHRC_ALIASES_DEST="$HOME/.zsh_aliases"
ZSHRC_ALIASES_SOURCE="$HOME/.dotfiles/zsh_aliases"
ZSHRC_DEST="$HOME/.zshrc"
ZSHRC_EXTENSIONS_SOURCE="$HOME/.dotfiles/zsh_extensions"
ZSHRC_SOURCE="$HOME/.dotfiles/zshrc"
ZZSHRC_EXTENSIONS_DEST="$HOME/.zsh_extensions"

check_dir_exists() {
    [ -d "$1" ]
}
check_file_exists() {
    [ -f "$1" ]
}

# Function to install Oh My Zsh
install_ohmyzsh() {
    warning "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    success "Oh My Zsh installation completed."
}

# Function to link custom .zshrc
link_zshrc() {
    warning "Linking custom .zshrc from dotfiles..."
    ln -vsnf "$ZSHRC_SOURCE" "$ZSHRC_DEST"
    success "Linked .zshrc successfully."
}

setup_ohmyzsh() {
    if prompt_yes_no "Do you want to set up oh-my-zsh now?"; then
        if ! check_dir_exists "$OH_MY_ZSH_DEST"; then
            install_ohmyzsh
        else
            warning "Oh My Zsh is already installed."
        fi

        if ! check_file_exists "$ZSHRC_ALIASES_DEST"; then
            ln -vsnf "$ZSHRC_ALIASES_SOURCE" "$ZSHRC_ALIASES_DEST"
            success "Linked .zsh_aliases successfully."
        else
            warning ".zsh_aliases already exists in home directory. Skipping linking."
        fi

        if ! check_file_exists "$ZZSHRC_EXTENSIONS_DEST"; then
            ln -vsnf "$ZSHRC_EXTENSIONS_SOURCE" "$ZZSHRC_EXTENSIONS_DEST"
            success "Linked .zsh_extensions successfully."
        else
            warning ".zsh_extensions already exists in home directory. Skipping linking."
        fi

        if ! check_file_exists "$ZSHRC_DEST"; then
            link_zshrc
        else
            warning ".zshrc already exists in home directory."
            if prompt_yes_no "Do you want to back up the existing .zshrc and link the custom one?"; then
                if [ -e "${ZSHRC_DEST}.bak" ]; then
                    if prompt_yes_no "Backup file ${ZSHRC_DEST}.bak already exists. Overwrite?"; then
                        mv -f "$ZSHRC_DEST" "${ZSHRC_DEST}.bak"
                    else
                        warning "Backup aborted. Existing .zshrc not overwritten."
                        return 1
                    fi
                else
                    mv "$ZSHRC_DEST" "${ZSHRC_DEST}.bak"
                fi
                info "Backed up existing .zshrc to .zshrc.bak"
                link_zshrc
            else
                warning "Skipping linking custom .zshrc."
            fi
        fi
    else
        warning "Skipping Oh My Zsh installation."
    fi
}
