#!/bin/bash

#
# Setup / Git
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

# Copy the .gitignore_global
if [ -f "$HOME/.gitignore_global" ]; then
  echo
fi
cp ../config/git/.gitignore_global $HOME
