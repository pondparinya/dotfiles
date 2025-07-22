# Function to check if Oh My Zsh is already installed
is_ohmyzsh_installed() {
  [ -d "$HOME/.oh-my-zsh" ]
}

# Function to install Oh My Zsh
install_ohmyzsh() {
  if ! is_ohmyzsh_installed; then
    print_message $YELLOW "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    print_message $GREEN "Oh My Zsh installation completed."
  else
    print_message $YELLOW "Oh My Zsh is already installed. Skipping installation."
  fi
}

# Function to link custom .zshrc
link_zshrc() {
  local dotfiles_zshrc="$HOME/.dotfiles/.zshrc"
  local home_zshrc="$HOME/.zshrc"

  if [ -f "$dotfiles_zshrc" ]; then
    print_message $YELLOW "Linking custom .zshrc from dotfiles..."
    ln -vsnf "$dotfiles_zshrc" "$home_zshrc"
    print_message $GREEN "Custom .zshrc linked."
  else
    print_message $RED "Custom .zshrc file not found in dotfiles. Skipping linking."
  fi
}

set_up_ohmyzsh() {
  read -p "Do you want to install oh-my-zsh? (y/n) " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    install_ohmyzsh
    if is_ohmyzsh_installed; then
      link_zshrc
    fi
  else
    print_message $YELLOW "Skipping setting oh-my-zsh."
  fi
}
