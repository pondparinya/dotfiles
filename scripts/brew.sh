. ./scripts/apps.sh
. ./scripts/packages.sh

install_brew_packages(){

  echo "---------------------------------------------"
  echo "Homebrew Starting..."
  echo "---------------------------------------------"

  echo "Homebrew Update & Upgrade Starting..."
  # Make sure we’re using the latest Homebrew.[cli]
  brew update
  # Upgrade any already-installed formulae. [cil]
  brew upgrade
  echo "Homebrew Update & Upgrade Ending..."

  install_brew_formulars
  install_brew_apps

  echo "Homebrew Cleanup..."
  # Remove outdated versions from the cellar. [cli]
  brew cleanup

  echo "---------------------------------------------"
  echo "Homebrew Ending..."
  echo "---------------------------------------------"

}


