#!/bin/bash
#
# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print messages with colors
print_message() {
  local color=$1
  local message=$2
  echo -e "${color}${message}${NC}"
}

# Function to print a specified number of new lines
print_new_lines() {
  local lines=$1
  for ((i = 0; i < lines; i++)); do
    echo ""
  done
}

# Function to check if a directory exists
directory_exists() {
  if [ -d "$1" ]; then
    print_message $YELLOW "$1 already exists."
    return 0
  else
    return 1
  fi
}
