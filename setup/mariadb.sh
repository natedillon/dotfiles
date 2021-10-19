#!/bin/bash

#
# MariaDB
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

info "Setting up MariaDB..."
mysql_install_db
sudo mariadb-secure-installation
