# Function to install Homebrew
install_homebrew() {
  read -p "Do you want to install Homebrew? (y/n) " choice
  if [[ "$choice" =~ ^[Yy]$ ]]; then
    if ! command -v brew &>/dev/null; then
      print_message "$YELLOW" "Homebrew is not installed. Installing Homebrew..."

      # Detect architecture and install Homebrew in the correct location
      if [[ "$(uname -m)" == "arm64" ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
      else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/usr/local/bin/brew shellenv)"
      fi

      print_message "$GREEN" "Homebrew installation completed."
    else
      print_message "$YELLOW" "Homebrew is already installed. Skipping installation."
    fi
  else
    print_message "$YELLOW" "Skipping Homebrew installation."
  fi
}
