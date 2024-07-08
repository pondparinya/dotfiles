# Function to install brew packages from a list
install_brew_packages() {
  local package_list="./utils/brew_packages.txt"
  read -p "Do you want to install brew packages? (y/n) " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    # Check if the package list file exists
    if [[ -f "$package_list" ]]; then
      # Read the package list and install each package
      for package in $(cat "$package_list"); do
        read -p "Do you want to install $package? (y/n) " package_choice
        if [[ "$package_choice" == "y" || "$package_choice" == "Y" ]]; then
          print_message $YELLOW "Installing $package..."
          brew install "$package"
          if [[ $? -eq 0 ]]; then
            print_message $GREEN "'$package' installation completed."
          else
            print_message $RED "Error: Installation of '$package' failed."
          fi
        else
          print_message $YELLOW "Skipping $package installation."
        fi
      done
      print_message $GREEN "Package installation completed."
    else
      print_message $RED "Package list file '$package_list' not found."
    fi
  else
    print_message $YELLOW "Skipping package installation."
  fi
}

# Function to install Homebrew cask fonts and a specific font
install_fonts() {
  read -p "Do you want to install font-terminess-ttf-nerd-font? (y/n) " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    print_message $YELLOW "Tapping homebrew/cask-fonts and installing font-terminess-ttf-nerd-font..."
    brew install --cask font-terminess-ttf-nerd-font
    if [[ $? -eq 0 ]]; then
      print_message $GREEN "Font installation completed."
    else
      print_message $RED "Error: Installation of font-terminess-ttf-nerd-font failed."
    fi
  else
    print_message $YELLOW "Skipping Font installation."
  fi
}
