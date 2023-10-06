#!/bin/bash

#
# Install / npm packages
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

name="npm packages"

echo
info "Installing $name..."
npm install --global npm-check-updates
npm install --global typescript
