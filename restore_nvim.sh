#!/bin/bash

. scripts/print.sh

# Function to restore Neovim-related files from .bak
restore_nvim() {
    local dirs=(~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim)
    local to_restore=()

    read -p "Do you want to restore Neovim backups? (y/n) " choice
    [[ "$choice" =~ ^[Yy]$ ]] || {
        print_message "$YELLOW" "Skipping Neovim restore."
        return
    }

    echo -e "\nThe following backups will be restored:"
    for dir in "${dirs[@]}"; do
        if [[ -d "${dir}.bak" ]]; then
            echo "  - ${dir}.bak → $dir"
            to_restore+=("$dir")
        fi
    done

    if [[ ${#to_restore[@]} -eq 0 ]]; then
        print_message "$YELLOW" "No backups found to restore."
        return
    fi

    read -p "Proceed with restoration? (y/n) " confirm
    [[ "$confirm" =~ ^[Yy]$ ]] || {
        print_message "$YELLOW" "Neovim restore cancelled."
        return
    }

    for dir in "${to_restore[@]}"; do
        [[ -d "$dir" ]] && rm -rf "$dir"
        mv "${dir}.bak" "$dir"
    done

    print_message "$GREEN" "Neovim restore completed."

    echo -e "\nRestored directories:"
    for dir in "${to_restore[@]}"; do
        [[ -d "$dir" ]] && ls -ld "$dir"
    done
}

restore_nvim
