#!/bin/bash

. scripts/print.sh

# Define the target directory within the user's home directory
TARGET_DIR="$HOME/.my-AstroNvim"
TARGET_BAK_DIR="$HOME/.my-AstroNvim.bak"

# Define the GitHub repository URL and the destination directory
REPO_URL="https://github.com/pondparinya/my-AstroNvim.git"

# Define the source and destination for the symbolic link
SOURCE=$TARGET_DIR
DESTINATION="$HOME/.config/nvim"

install_myAstroNvim() {
  read -p "Do you want to set up myAstroNvim? (y/n) " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    if directory_exists "$TARGET_DIR"; then
      if directory_exists "$TARGET_BAK_DIR"; then
        print_message $YELLOW "Removing old backup directory ${TARGET_BAK_DIR}."
        rm -rf "$TARGET_BAK_DIR"
      fi
      mv -v "$TARGET_DIR" "$TARGET_BAK_DIR"
    fi
    print_message $YELLOW "Cloning the repository..."
    git clone "$REPO_URL" "$TARGET_DIR"
  else
    print_message $YELLOW "Skipping myAstroNvim setup."
  fi
}

link_myAstroNvim() {
  if directory_exists "$DESTINATION"; then
    if directory_exists "${DESTINATION}.bak"; then
      print_message $YELLOW "Removing old backup directory ${DESTINATION}.bak."
      rm -rf "${DESTINATION}.bak"
    fi
    rm -rf "$DESTINATION/.git"
    cp -r "$DESTINATION" "${DESTINATION}.bak"
    rm -rf "${DESTINATION}"
  fi

  # Create the symbolic link
  print_message $YELLOW "Creating symbolic link..."
  ln -vsfn "$SOURCE" "$DESTINATION"

  # Check if the symbolic link creation was successful
  if [ $? -eq 0 ]; then
    print_message $GREEN "Symbolic link created successfully."
  else
    print_message $RED "Failed to create symbolic link."
  fi
}

clean_nvim() {
  read -p "Do you want clean neovim? (y/n) " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    rm -rf ~/.local/share/nvim ~/.local/share/nvim.bak
    rm -rf ~/.local/state/nvim ~/.local/state/nvim.bak
    rm -rf ~/.cache/nvim ~/.cache/nvim.bak
    print_message $GREEN "Done clean neovim."
  else
    print_message "$YELLOW" "Skipping clean neovim."
  fi

}

set_up_neovim() {
  clean_nvim
  install_myAstroNvim
  if directory_exists "$TARGET_DIR"; then
    read -p "Do you want to link myAstroNvim to ${DESTINATION}? (y/n) " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      link_myAstroNvim
    else
      print_message $YELLOW "Skipping link myAstroNvim to ${DESTINATION}."
    fi
  fi
}

set_up_neovim
