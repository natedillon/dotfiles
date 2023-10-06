#!/bin/bash

#
# Install / Node Version Manager
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

name="Node Version Manager"

if [ -f "$HOME/.nvm/nvm.sh" ]; then
  source $HOME/.nvm/nvm.sh
fi

echo
info "Checking for $name..."
if command -v nvm &> /dev/null; then
  info "Already installed"
  info "Updating..."
else
  info "Installing..."
fi
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source $HOME/.nvm/nvm.sh

# Set default global npm packages
cp ../config/nvm/default-packages $NVM_DIR
