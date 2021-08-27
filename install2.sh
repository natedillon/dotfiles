#!/bin/bash

set -eo pipefail

source scripts/functions.sh

echo
yellow "=========================================="
blue   "  natedillon/dotfiles"
echo   "  https://github.com/natedillon/dotfiles"
yellow "=========================================="


# Installer function
# -------------------------

dotfiles_installer () {

  # Create backups

  source ./install/xcode.sh
  source ./install/oh-my-zsh.sh
  source ./install/homebrew.sh
  source ./install/homebrew-packages.sh
  # nvm
  # npm-check-updates

  source ./setup/ssh.sh

  # Apache
  # PHP
  # MariaDB (MySQL)
  # Zsh

  # Clean up empty backups

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
