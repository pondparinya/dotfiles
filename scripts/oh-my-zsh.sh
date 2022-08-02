# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[1;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'

install_oh_my_zsh() {
  if [[ ! -d ~/.oh-my-zsh/ ]]; then
    echo "${yellow}You want install oh-my-zsh ?${clear}"
    echo "${yellowa} Proceed? [y/n]: ${clear}"
    read ans
    if [ $ans = "y" ]; then
      echo "${blue}---------------------------------------------"
      echo "Start Installing Oh-my-zsh..."
      echo "---------------------------------------------"
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      echo "---------------------------------------------"
      echo "End Installing Oh-my-zsh..."
      echo "---------------------------------------------${clear}"
    fi
  else
    echo "${green}oh-my-zsh already installed${clear}"
  fi

}
