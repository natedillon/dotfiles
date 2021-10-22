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
#curl -s "https://get.sdkman.io" | bash

# SDKMAN! config for M1

# Java
#sdk install java 11.0.12-librca
