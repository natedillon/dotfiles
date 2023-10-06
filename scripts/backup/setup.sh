#!/bin/bash

#
# Backup / Setup
#

# Create a backup directory with the current date and time
backup_root="$HOME/.dotfiles_backup"
backup_location="$backup_root/$(date +"%Y-%m-%d-%I-%M-%S")"
if [ ! -d $backup_root ]; then
  mkdir $backup_root
fi
mkdir $backup_location
