#!/bin/bash

#
# Install / Xcode Command Line Developer Tools
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

name="Xcode Command Line Developer Tools"

echo
info "Checking for $name..."
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}"; then
  info "Already installed"
else
  info "Installing..."
  xcode-select --install
fi
