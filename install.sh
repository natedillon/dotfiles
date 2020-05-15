#!/bin/bash

set -eo pipefail

source ./functions/colors.sh
source ./functions/alerts.sh

echo
yellow "=========================================="
blue   "  natedillon/dotfiles"
echo   "  https://github.com/natedillon/dotfiles"
yellow "=========================================="

dotfiles_installer () {
  # Xcode Command Line Developer Tools
  info "Checking for Xcode Command Line Developer Tools..."
  if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}"; then
    success "Xcode Command Line Developer Tools are installed"
  else
    info "Installing Xcode Command Line Developer Tools..."
    xcode-select --install
  fi

  # Homebrew
  info "Checking for Homebrew..."
  if hash brew 2>/dev/null; then
    success "Homebrew is installed"
    info "Updating Homebrew..."
    brew update
  else
    info "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Homebrew packages
  info "Installing Homebrew packages..."
  brew tap homebrew/bundle
  brew bundle --verbose --file="./brewfiles/Brewfile"

  # Homebrew Mac App Store apps
  info "Installing Mac App Store apps..."
  brew bundle --verbose --file="./brewfiles/Brewfile.mas"

  # Homebrew casks
  info "Installing Homebrew casks..."
  brew bundle --verbose --file="./brewfiles/Brewfile.casks"

  # Grunt
  #npm install -g grunt-cli

  # Drush Launcher
  #curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
  #chmod +x drush.phar
  #sudo mv drush.phar /usr/local/bin/drush

  # Oh My Zsh

  # zsh-syntax-highlighting

  # Copy .zshrc to home directory
  #cp ./.zshrc $HOME

  # GitHub SSH

  # Local development setup
  # https://ntdln.com/2018/12/20/macos-local-development-setup/

  # K-State stuff
  # GlobalProtect
  # open https://gpvpn.ksu.edu/
}

# Confirm the user would like to run the installer
echo
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  run_installer=true
else
  while true; do
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n): " input
    case $input in
      [yY][eE][sS]|[yY] ) run_installer=true; break;;
      [nN][oO]|[nN] ) run_installer=false; break;;
      * ) warning "Please answer yes (Y/y) or no (N/n).";;
    esac
  done
fi

# Run the installer
if $run_installer; then
  info "Running the installer..."
  dotfiles_installer
fi
