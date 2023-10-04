#!/bin/zsh

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
brew bundle --verbose --no-lock --file="../homebrew/High-Touch.Brewfile"

# npm packages
echo
info "Installing npm packages..."
# Yarn
npm install --global yarn
# Vue: Volar
npm install --global @volar/vue-language-server
# Vue: Vetur
npm install --global vls@0.7.4

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
echo
info "Checking for Java..."
if command -v java &> /dev/null; then
  info "Already installed"
else
  info "Installing..."
  sdk install java 11.0.12-librca
fi

# Zsh settings
echo
info "Adding .hightouch to home directory..."
cp ../.hightouch $HOME
source $HOME/.zshrc
