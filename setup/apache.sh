#!/bin/bash

#
# Apache
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

info "Setting up Apache..."

# Backup existing files
#if [ -f "/etc/apache2/httpd.conf" ]; then
#  info "Making a backup of the existing httpd.conf..."
#  cp /etc/apache2/httpd.conf $backup_location
#fi
#if [ -f "/etc/apache2/extra/httpd-userdir.conf" ]; then
#  info "Making a backup of the existing httpd-userdir.conf..."
#  cp /etc/apache2/extra/httpd-userdir.conf $backup_location
#fi
#if [ -f "/etc/apache2/users/nate.conf" ]; then
#  info "Making a backup of the existing nate.conf..."
#  cp /etc/apache2/users/nate.conf $backup_location
#fi

# Copy Apache config files
sudo cp config/apache2/httpd.conf /etc/apache2
sudo cp config/apache2/extra/httpd-userdir.conf /etc/apache2/extra
sudo cp config/apache2/users/nate.conf /etc/apache2/users

# Restart Apache
sudo apachectl restart
