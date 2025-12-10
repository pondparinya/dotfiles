#!/bin/bash

set -euo pipefail

# Load print functions
source "scripts/print.sh"

install_brew_packages() {
    warning "Checking brew packages..."

    local package_file="utils/brew_packages.txt"

    if [[ ! -f "$package_file" ]]; then
        error "Package file not found: $package_file"
        return 1
    fi

    # Read packages manually (skip comments & empty lines)
    local packages=()
    while IFS= read -r line; do
        # Skip empty lines or lines starting with #
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
        packages+=("$line")
    done <"$package_file"

    if [[ ${#packages[@]} -eq 0 ]]; then
        warning "No packages listed in $package_file. Nothing to do."
        return 0
    fi

    local to_install=()
    for package in "${packages[@]}"; do
        if brew list "$package" &>/dev/null; then
            info "$package is already installed."
        else
            to_install+=("$package")
        fi
    done

    if [[ ${#to_install[@]} -gt 0 ]]; then
        info "Installing missing packages: ${to_install[*]}..."
        if brew install "${to_install[@]}"; then
            success "All brew packages are now installed."
        else
            error "Failed to install some brew packages."
            return 1
        fi
    else
        success "All required brew packages are already installed."
    fi
}
