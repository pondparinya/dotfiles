#!/bin/bash

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print a formatted message
print_message() {
    local color="$1"
    shift
    local message="$@"
    echo -e "${color}${message}${NC} \n"
}

# Convenience functions for different message types
info() { print_message "${CYAN}" "$@"; }
success() { print_message "${GREEN}" "$@"; }
error() { print_message "${RED}" "$@"; }
warning() { print_message "${YELLOW}" "$@"; }

# Prompt user with a yes/no question
prompt_yes_no() {
    local question="$1"
    local answer
    while true; do
        echo -en "${YELLOW}${question} [y/n]: ${NC}"
        read -r answer
        case $answer in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) error "Invalid input. Please answer y or n." ;;
        esac
    done
}
