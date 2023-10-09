#!/bin/zsh

#
# Setup / Zsh
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

echo
info "Adding .zshrc to home directory..."
cp ../.zshrc $HOME
source $HOME/.zshrc
