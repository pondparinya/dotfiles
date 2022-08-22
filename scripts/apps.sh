apps=(
  brave-browser
  kitty
  discord
  spotify
  docker
  robo-3t
)
install_brew_apps() {
  echo "You want install Applications ?"
  echo "---------------------------------------------"
  for d in ${apps[@]}; do
    echo - $d
  done
  echo "---------------------------------------------"

  echo -n "Proceed? [y/n]: "

  read ans
  if [[ $ans == "y" ]]; then
    echo "---------------------------------------------"
    echo "Start Installing Apps..."
    echo "---------------------------------------------"
    process_brew_apps
    echo "---------------------------------------------"
    echo "End Installing Apps..."
    echo "---------------------------------------------"
  fi

}

process_brew_apps() {

  for cask in ${apps[@]}; do
    if brew list --cask | grep "$cask" >/dev/null; then
      echo "App $cask is already installed"
    else
      echo "Installing app < $cask >"
      brew install --cask "$cask"
    fi
  done
}
