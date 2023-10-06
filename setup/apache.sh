#!/bin/bash

#
# Setup / Apache
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

info "Setting up Apache..."

# Copy Apache config files
sudo cp config/apache2/httpd.conf /etc/apache2
sudo cp config/apache2/extra/httpd-userdir.conf /etc/apache2/extra
sudo cp config/apache2/users/nate.conf /etc/apache2/users

# Restart Apache
sudo apachectl restart
