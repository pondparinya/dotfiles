# Function to install Homebrew
install_homebrew() {
  read -p "Do you want to install Homebrew? (y/n) " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    # Check if Homebrew is installed
    if ! command -v brew &>/dev/null; then
      print_message $YELLOW "Homebrew is not installed. Installing Homebrew..."

      # Install Homebrew
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

      print_message $GREEN "Homebrew installation completed."

    else
      print_message $YELLOW "Homebrew is already installed. Skipping installation."
    fi
  else
    print_message $YELLOW "Skipping Homebrew installation."
  fi
}
