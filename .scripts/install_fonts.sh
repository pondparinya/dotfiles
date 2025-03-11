# Function to install Homebrew cask fonts
install_fonts() {
  local fonts=(
    "font-terminess-ttf-nerd-font"
    "font-jetbrains-mono-nerd-font"
    "font-fira-code-nerd-font"
    "font-iosevka-nerd-font"
  )

  print_message $YELLOW "Tapping homebrew/cask-fonts..."
  for font in "${fonts[@]}"; do
    read -p "Do you want to install $font? (y/n) " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      print_message $YELLOW "Installing $font..."
      brew install --cask "$font"
      if [[ $? -eq 0 ]]; then
        print_message $GREEN "$font installation completed."
      else
        print_message $RED "Error: Installation of $font failed."
      fi
    else
      print_message $YELLOW "Skipping $font installation."
    fi
  done
}
