#!/bin/bash

# Load shared functions and scripts
source scripts/print.sh
source scripts/install_homebrew.sh
source scripts/install_brew_packages.sh
source scripts/install_fonts.sh
source scripts/setup_shell.sh
source scripts/install_nvim.sh
source scripts/install_ohmyzsh.sh

main() {
    info "Starting dotfiles setup..."

    install_homebrew
    install_brew_packages
    install_fonts
    setup_shell
    setup_neovim
    setup_ohmyzsh

    success "Dotfiles setup completed."
}

main
