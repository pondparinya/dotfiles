. ./scripts/apps.sh
. ./scripts/packages.sh

install_brew_packages(){

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[1;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'


  echo "${blue}---------------------------------------------${clear}"
  echo "${blue}Homebrew Starting...${clear}"
  echo "${blue}---------------------------------------------${clear}"

  echo "${yellow}Homebrew Update & Upgrade Starting...${clear}"
  # Make sure we’re using the latest Homebrew.[cli]
  brew update
  # Upgrade any already-installed formulae. [cil]
  brew upgrade
  echo "${yellow}Homebrew Update & Upgrade Ending...${clear}"

  install_brew_formulars
  install_brew_apps

  echo "${yellow}Homebrew Cleanup...${clear}"
  # Remove outdated versions from the cellar. [cli]
  brew cleanup

  echo "${blue}---------------------------------------------${clear}"
  echo "${blue}Homebrew Ending...${clear}"
  echo "${blue}---------------------------------------------${clear}"

}


