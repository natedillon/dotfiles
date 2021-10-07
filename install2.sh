#!/bin/bash

set -eo pipefail

source functions/colors.sh
source functions/alerts.sh

echo
yellow "=========================================="
blue   "  natedillon/dotfiles"
echo   "  https://github.com/natedillon/dotfiles"
yellow "=========================================="


# Installer function
# -------------------------

dotfiles_installer () {

  # Create backup directory

  # Install software
  cd ./install
  source ./xcode.sh
  source ./oh-my-zsh.sh
  source ./homebrew.sh
  source ./homebrew-packages.sh
  # nvm
  # npm-check-updates
  cd - > /dev/null

  # Configure software
  cd ./setup
  source ./ssh.sh
  # Git
  # Apache
  # PHP
  # MariaDB (MySQL)
  # macOS + Mac apps
  # Zsh
  cd - > /dev/null

  # Clean up empty backup directories

  echo
  success "dotfiles installation complete! 🎉"
}


# Confirm the user would like to run the installer
# -------------------------

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  run_installer=true
else
  while true; do
    echo
    echo "This may overwrite existing files in your home directory."
    read -p "Do you want to continue? [y/n]: " input
    case $input in
      [yY][eE][sS]|[yY] ) run_installer=true; break;;
      [nN][oO]|[nN] ) run_installer=false; break;;
      * ) warning "\nPlease answer yes [Y/y] or no [N/n].";;
    esac
  done
fi


# Run the installer
# -------------------------

if $run_installer; then
  echo
  info "Running the installer..."
  dotfiles_installer
fi

echo
