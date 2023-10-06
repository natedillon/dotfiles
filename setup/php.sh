#!/bin/bash

#
# Setup / PHP
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

info "Setting up PHP..."

# Copy PHP config file
sudo cp config/php/7.4/php.ini /usr/local/etc/php/7.4
