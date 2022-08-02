# !/bin/bash

. scripts/brew.sh
. scripts/oh-my-zsh.sh

main() {

  # install_oh_my_zsh
  install_oh_my_zsh
  # Install Packages & Apps From Homebrew
  install_brew_packages
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
}

main
