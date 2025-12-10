#!/bin/bash

set -euo pipefail

source "scripts/print.sh"

# --- Configuration ---
# Use realpath to get the absolute path of the source directory
SOURCE_DIR="$(realpath "$(dirname "$0")/config/nvim")"
CONFIG_DEST="$HOME/.config/nvim"
DATA_DEST="$HOME/.local/share/nvim"
STATE_DEST="$HOME/.local/state/nvim"
CACHE_DEST="$HOME/.cache/nvim"

# --- Helper Functions ---

# Backs up a given path to path.bak
backup_path() {
    local path="$1"
    if [[ -e "$path" || -L "$path" ]]; then
        local backup_path="${path}.bak"
        info "Backing up $path to $backup_path"
        # Remove old backup if it exists
        if [[ -e "$backup_path" ]]; then
            rm -rf "$backup_path"
        fi
        mv "$path" "$backup_path"
    fi
}

# Removes a given path if it exists
remove_path() {
    local path="$1"
    if [[ -e "$path" || -L "$path" ]]; then
        info "Removing $path"
        rm -rf "$path"
    fi
}

# --- Main Functions ---

setup_neovim() {
    warning "Starting Neovim setup..."

    # 1. Backup existing Neovim directories
    if prompt_yes_no "Do you want to back up existing Neovim directories?"; then
        backup_path "$CONFIG_DEST"
        backup_path "$DATA_DEST"
        backup_path "$STATE_DEST"
        backup_path "$CACHE_DEST"
        success "Backup complete."
    else
        warning "Skipping backup."
    fi

    # 2. Clean Neovim cache and state directories
    if prompt_yes_no "Do you want to clean Neovim cache, state, and data directories?"; then
        # Ensure config is not deleted if user skipped backup
        if [[ ! -e "${CONFIG_DEST}.bak" && -e "$CONFIG_DEST" ]]; then
            backup_path "$CONFIG_DEST"
        fi
        remove_path "$DATA_DEST"
        remove_path "$STATE_DEST"
        remove_path "$CACHE_DEST"
        success "Cleanup complete."
    else
        warning "Skipping cleanup."
    fi

    # 3. Link the new configuration
    if prompt_yes_no "Do you want to link your dotfiles Neovim config?"; then
        # Ensure destination is clear before linking
        if [[ -e "$CONFIG_DEST" ]]; then
            error "Destination $CONFIG_DEST already exists. Please back up or remove it first."
            return 1
        fi

        info "Creating symbolic link: $CONFIG_DEST -> $SOURCE_DIR"
        if ln -s "$SOURCE_DIR" "$CONFIG_DEST"; then
            success "Symbolic link created successfully."
        else
            error "Failed to create symbolic link."
            return 1
        fi
    else
        warning "Skipping symlink creation."
    fi

    success "Neovim setup finished."
}
