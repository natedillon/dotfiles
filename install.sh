#!/bin/bash

source ./functions/colors.sh
source ./functions/alerts.sh

info "natedillon/dotfiles installer (https://github.com/natedillon/dotfiles)"

dotfiles_installer () {
  # Xcode Command Line Developer Tools
  if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}"; then
    success "Xcode Command Line Developer Tools are already installed"
  else
    info "Installing Xcode Command Line Developer Tools"
  fi

  # Homebrew
  if hash brew 2>/dev/null; then
    success "Homebrew is already installed"
  else
    info "Installing Homebrew"
  fi

  # homebrew-cask-versions

  # Brewfile

  # Grunt

  # Drush Launcher

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

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  # Run the installer
  info "Forced run of the installer"
else
  while true; do
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n): " input
    case $input in
      [yY][eE][sS]|[yY] ) run_installer=true; break;;
      [nN][oO]|[nN] ) run_installer=false; break;;
      * ) warning "Please answer yes (Y/y) or no (N/n).";;
    esac
  done
  if $run_installer; then
    # Run the installer
    info "Running the installer"
  fi
fi
