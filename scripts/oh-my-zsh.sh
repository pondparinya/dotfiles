install_oh_my_zsh() {
  echo "---------------------------------------------"
  echo "Start Installing Oh-my-zsh..."
  echo "---------------------------------------------"

  if [[ ! -f ~/.zshrc ]]; then
    echo "Installing oh my zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  else
    echo "oh-my-zsh already installed"
  fi
  echo "---------------------------------------------"
  echo "End Installing Oh-my-zsh..."
  echo "---------------------------------------------"

}
