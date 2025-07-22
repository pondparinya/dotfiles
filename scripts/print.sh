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
    local message="$2"
    echo -e "${color}${message}${NC}"
}

# Prompt user with a yes/no question
prompt_yes_no() {
    local question="$1"
    while true; do
        read -rp "$(echo -e "${YELLOW}${question} [y/n]: ${NC}")" yn
        case $yn in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) echo "Please answer y or n." ;;
        esac
    done
}
