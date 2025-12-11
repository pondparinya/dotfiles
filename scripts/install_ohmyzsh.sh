#!/bin/bash

set -euo pipefail

source "scripts/print.sh"

# --- Configuration ---
OH_MY_ZSH_DEST="$HOME/.oh-my-zsh"
ZSHRC_ALIASES_DEST="$HOME/.zshrc_aliases"
ZSHRC_ALIASES_SOURCE="$HOME/.dotfiles/.zshrc_aliases"
ZSHRC_DEST="$HOME/.zshrc"
ZSHRC_EXTENSIONS_SOURCE="$HOME/.dotfiles/.zshrc_extensions"
ZSHRC_SOURCE="$HOME/.dotfiles/.zshrc"
ZSHRC_EXTENSIONS_DEST="$HOME/.zshrc_extensions"
ZSHRC_OHMYZSH_CUSTOM_DEST="$HOME/.zshrc_ohmyzsh_custom"
ZSHRC_OHMYZSH_CUSTOM_SOURCE="$HOME/.dotfiles/.zshrc_ohmyzsh_custom"

check_dir_exists() {
    [ -d "$1" ]
}
check_file_exists() {
    [ -f "$1" ]
}

# Function to install Oh My Zsh
install_ohmyzsh() {
    warning "Installing Oh My Zsh..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$OH_MY_ZSH_DEST"
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
            success "Linked .zshrc_aliases successfully."
        else
            warning ".zshrc_aliases already exists in home directory. Skipping linking."
        fi

        if ! check_file_exists "$ZSHRC_EXTENSIONS_DEST"; then
            ln -vsnf "$ZSHRC_EXTENSIONS_SOURCE" "$ZSHRC_EXTENSIONS_DEST"
            success "Linked .zshrc_extensions successfully."
        else
            warning ".zshrc_extensions already exists in home directory. Skipping linking."
        fi

        if ! check_file_exists "$ZSHRC_OHMYZSH_CUSTOM_DEST"; then
            ln -vsnf "$ZSHRC_OHMYZSH_CUSTOM_SOURCE" "$ZSHRC_OHMYZSH_CUSTOM_DEST"
            success "Linked .zshrc_ohmyzsh_custom successfully."
        else
            warning ".zshrc_ohmyzsh_custom already exists in home directory. Skipping linking."
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
