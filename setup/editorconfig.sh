#!/bin/bash

#
# EditorConfig
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

# TODO: Make backup of existing file

echo
info "Adding .editorconfig to home directory..."
cp ../.editorconfig $HOME
