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
    if prompt_yes_no "Do you want to initial Homebrew ?"; then
        info "Setting up Homebrew and packages..."
        install_homebrew
        install_brew_packages
        success "Homebrew and packages setup completed."

    else
        warning "Skipping Homebrew and packages setup."
    fi
    # install_fonts

    if prompt_yes_no "Do you want to setup zsh to default now?"; then
        setup_shell
    else
        warning "Skipping shell setup."
    fi

    if prompt_yes_no "Do you want to setup Neovim now?"; then
        setup_neovim
    else
        warning "Skipping Neovim setup."
    fi

    if prompt_yes_no "Do you want to setup Oh My Zsh now?"; then
        setup_ohmyzsh
    else
        warning "Skipping Oh My Zsh setup."
    fi

    success "Dotfiles setup completed."
}

main
