#!/bin/bash

# Source the individual scripts
source .scripts/print.sh
source .scripts/install_homebrew.sh
source .scripts/install_brew_packages.sh
source .scripts/install_fonts.sh
source .scripts/set_default_shell.sh

main() {
  install_homebrew
  install_brew_packages
  install_fonts
  set_default_shell
  source install_nvim.sh
}

# Call the main function
main

# End of file
