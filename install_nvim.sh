#!/bin/bash

. .scripts/print.sh

SOURCE="$HOME/.dotfiles/.config/nvim"
DESTINATION="$HOME/.config/nvim"
# Function to create a symbolic link for AstroNvim
link_neovim() {
  if directory_exists "$DESTINATION"; then
    [ -d "${DESTINATION}.bak" ] && {
      print_message $YELLOW "Removing old backup directory ${DESTINATION}.bak."
      rm -rf "${DESTINATION}.bak"
    }
    rm -rf "$DESTINATION/.git"
    mv "$DESTINATION" "${DESTINATION}.bak"
    unlink "${DESTINATION}.bak"
  fi

  print_message $YELLOW "Creating symbolic link..."
  ln -vsfn "$SOURCE" "$DESTINATION" &&
    print_message $GREEN "Symbolic link created successfully." ||
    print_message $RED "Failed to create symbolic link."
}

# Function to clean Neovim-related files
clean_nvim() {
  read -p "Do you want to clean Neovim? (y/n) " choice
  [[ "$choice" =~ ^[Yy]$ ]] || {
    print_message $YELLOW "Skipping Neovim cleanup."
    return
  }

  for dir in ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim; do
    rm -rf "$dir" "$dir.bak"
  done
  print_message $GREEN "Neovim cleanup completed."
}

# Function to backup Neovim-related files
backup_nvim() {
  read -p "Do you want to backup Neovim? (y/n) " choice
  [[ "$choice" =~ ^[Yy]$ ]] || {
    print_message $YELLOW "Skipping Neovim backup."
    return
  }

  for dir in ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim; do
    [ -d "$dir" ] && mv "$dir" "${dir}.bak"
  done

  print_message $GREEN "Neovim backup completed."
  ls -ld ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim 2>/dev/null
}

# Function to set up Neovim
set_up_neovim() {
  clean_nvim
  backup_nvim
  read -p "Do you want to link ./config/nvim to ${DESTINATION}? (y/n) " choice
  [[ "$choice" =~ ^[Yy]$ ]] && link_neovim ||
    print_message $YELLOW "Skipping linking ./config/nvim to ${DESTINATION}."
}

set_up_neovim
