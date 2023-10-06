#!/bin/bash

#
# Setup / EditorConfig
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

echo
info "Adding .editorconfig to home directory..."
cp ../.editorconfig $HOME
