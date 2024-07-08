#!/bin/bash

# Source the individual scripts
. scripts/print.sh
. scripts/install_homebrew.sh
. scripts/install_brew_packages.sh
. scripts/set_default_shell.sh
. scripts/install_ohmyzsh.sh

main() {
  install_homebrew
  install_brew_packages
  install_fonts
  set_default_shell
  set_up_ohmyzsh
  source install_nvim.sh
}

# Call the main function
main

# End of file
