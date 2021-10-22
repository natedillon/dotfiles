#!/bin/zsh

#
# Zsh
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

#if [ -f "$HOME/.zshrc" ]; then
#  info "Making a backup of .zshrc..."
#  cp $HOME/.zshrc $backup_location
#fi

echo
info "Adding .zshrc to home directory..."
cp ../.zshrc $HOME
source $HOME/.zshrc
