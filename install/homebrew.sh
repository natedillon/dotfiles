#!/bin/bash

#
# Homebrew
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

name="Homebrew"

echo
info "Checking for $name..."
if hash brew 2>/dev/null; then
  info "Already installed"
  info "Updating..."
  brew update
else
  info "Installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
