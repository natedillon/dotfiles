#!/bin/bash

#
# High Touch
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

# Homebrew packages
echo
info "Installing Homebrew packages..."
brew bundle --verbose --no-lock --file="./brewfiles/High-Touch.Brewfile"

# SDKMAN!
echo
info "Checking for SDKMAN!..."
if [ -d "$HOME/.sdkman" ]; then
  info "Already installed"
else
  info "Installing..."
  curl -s "https://get.sdkman.io" | bash
fi

# SDKMAN! config for M1
# TODO: Backup existing config file
echo
info "Adding SDKMAN! config file..."
cp ../config/sdkman/etc/config $HOME/.sdkman/etc

# Java
#sdk install java 11.0.12-librca
