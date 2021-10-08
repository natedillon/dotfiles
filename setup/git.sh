#!/bin/bash

cd "$(dirname "$0")"
cd ../functions
source ./colors.sh
source ./alerts.sh
cd - > /dev/null

# Copy the .gitignore_global
if [ -f "$HOME/.gitignore_global" ]; then
  echo
  #info "Making a backup of .gitignore_global..."
  #cp $HOME/.gitignore_global $backup_location
fi
cp ../config/git/.gitignore_global $HOME
