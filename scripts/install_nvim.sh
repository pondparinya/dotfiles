#!/bin/bash

. scripts/print.sh

SOURCE="$HOME/.dotfiles/config/nvim"
DESTINATION="$HOME/.config/nvim"

# Function to create a symbolic link for AstroNvim
link_neovim() {
    if [ -d "$DESTINATION" ] || [ -L "$DESTINATION" ]; then
        if [ -e "${DESTINATION}.bak" ]; then
            print_message "$YELLOW" "Removing old backup: ${DESTINATION}.bak"
            rm -rf "${DESTINATION}.bak"
        fi

        print_message "$YELLOW" "Backing up current $DESTINATION to ${DESTINATION}.bak"
        mv "$DESTINATION" "${DESTINATION}.bak"
    fi

    print_message "$YELLOW" "Creating symbolic link: $DESTINATION → $SOURCE"
    if ln -vsfn "$SOURCE" "$DESTINATION"; then
        print_message "$GREEN" "Symbolic link created successfully."
    else
        print_message "$RED" "Failed to create symbolic link."
    fi
}

# Function to clean Neovim-related files with confirmation
clean_nvim() {
    local dirs=(~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim)
    local to_delete=()

    read -p "Do you want to clean Neovim? (y/n) " choice
    [[ "$choice" =~ ^[Yy]$ ]] || {
        print_message "$YELLOW" "Skipping Neovim cleanup."
        return
    }

    echo -e "\nThe following directories will be removed:"
    for dir in "${dirs[@]}"; do
        [[ -d "$dir" ]] && echo "  - $dir"
        [[ -d "$dir.bak" ]] && echo "  - $dir.bak"
        [[ -d "$dir" ]] && to_delete+=("$dir")
        [[ -d "$dir.bak" ]] && to_delete+=("$dir.bak")
    done

    if [[ ${#to_delete[@]} -eq 0 ]]; then
        print_message "$YELLOW" "Nothing to remove."
        return
    fi

    read -p "Proceed with deletion? (y/n) " confirm
    [[ "$confirm" =~ ^[Yy]$ ]] || {
        print_message "$YELLOW" "Neovim cleanup cancelled."
        return
    }

    for path in "${to_delete[@]}"; do
        rm -rf "$path"
    done

    print_message "$GREEN" "Neovim cleanup completed."
}

# Function to backup Neovim-related files with confirmation
backup_nvim() {
    local dirs=(~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim)
    local to_backup=()

    read -p "Do you want to backup Neovim? (y/n) " choice
    [[ "$choice" =~ ^[Yy]$ ]] || {
        print_message "$YELLOW" "Skipping Neovim backup."
        return
    }

    echo -e "\nThe following directories will be moved to .bak:"
    for dir in "${dirs[@]}"; do
        if [[ -d "$dir" ]]; then
            echo "  - $dir → ${dir}.bak"
            to_backup+=("$dir")
        fi
    done

    if [[ ${#to_backup[@]} -eq 0 ]]; then
        print_message "$YELLOW" "Nothing to backup."
        return
    fi

    read -p "Proceed with backup? (y/n) " confirm
    [[ "$confirm" =~ ^[Yy]$ ]] || {
        print_message "$YELLOW" "Neovim backup cancelled."
        return
    }

    for dir in "${to_backup[@]}"; do
        mv "$dir" "${dir}.bak"
    done

    print_message "$GREEN" "Neovim backup completed."

    # Show the results (only existing .bak dirs)
    echo -e "\nBackup directories:"
    for dir in "${to_backup[@]}"; do
        [[ -d "${dir}.bak" ]] && ls -ld "${dir}.bak"
    done
}

# Function to set up Neovim
set_up_neovim() {
    clean_nvim
    backup_nvim
    read -p "Do you want to link ./config/nvim to ${DESTINATION}? (y/n) " choice
    [[ "$choice" =~ ^[Yy]$ ]] && link_neovim ||
        print_message "$YELLOW" "Skipping linking ./config/nvim to ${DESTINATION}."
}

set_up_neovim
