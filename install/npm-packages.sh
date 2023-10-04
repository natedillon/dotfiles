#!/bin/bash

#
# npm packages
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

name="npm packages"

# TODO: Check for Node and/or npm

echo
info "Installing $name..."
npm install --global npm-check-updates
npm install --global typescript
