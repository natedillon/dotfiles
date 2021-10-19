#!/bin/bash

#
# PHP
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

info "Setting up PHP..."

# Backup existing files
#if [ -f "/usr/local/etc/php/7.4/php.ini" ]; then
#  info "Making a backup of the existing php.ini file..."
#  cp /usr/local/etc/php/7.4/php.ini $backup_location
#fi

# Copy PHP config file
sudo cp config/php/7.4/php.ini /usr/local/etc/php/7.4
