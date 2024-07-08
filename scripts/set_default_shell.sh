# Function to set the default shell to zsh
set_default_shell() {
  read -p "Do you want to set the default shell to zsh? (y/n) " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    local os_version
    os_version=$(sw_vers -productVersion)

    if [[ "$os_version" == "10."* || "$os_version" == "11."* ]]; then
      print_message $YELLOW "Setting default shell to zsh for macOS High Sierra and older..."
      chsh -s /bin/zsh
    else
      local processor
      processor=$(uname -m)

      if [[ "$processor" == "arm64" ]]; then
        print_message $YELLOW "Setting default shell to zsh for M1 Mac..."
        chsh -s $(which zsh)
      else
        print_message $YELLOW "Setting default shell to zsh for Intel Mac..."
        chsh -s /usr/local/bin/zsh
      fi
    fi
  else
    print_message $YELLOW "Skipping setting default shell to zsh."
  fi
}
