#!/bin/bash

source ./functions/colors.sh
source ./functions/alerts.sh

info "Installing natedillon/dotfiles (https://github.com/natedillon/dotfiles)"

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

# GitHub SSH

# Local development setup
# https://ntdln.com/2018/12/20/macos-local-development-setup/

# K-State stuff
# GlobalProtect
# open https://gpvpn.ksu.edu/
