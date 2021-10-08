#!/bin/bash

# SSH keys
# -------------------------

cd "$(dirname "$0")"
cd ../functions
source ./colors.sh
source ./alerts.sh
source ./get-email.sh
cd - > /dev/null

info "Checking for SSH keys..."
private_key=$HOME/.ssh/id_rsa
public_key=$HOME/.ssh/id_rsa.pub
if [ -f "$private_key" ]; then private_key_exists=true; else private_key_exists=false; fi
if [ -f "$public_key" ];  then public_key_exists=true;  else public_key_exists=false;  fi
if $private_key_exists && $public_key_exists; then
  info "SSH keys already exist"
  generate_keys=false
elif $private_key_exists || $public_key_exists; then
  if ! $private_key_exists; then
    warning "Private SSH key does not exist"
  elif ! $public_key_exists; then
    warning "Public SSH key does not exist"
  fi
  while true; do
    read -p "Would you like to generate new SSH keys? This may overwrite existing keys. [y/n]: " input
    case $input in
      [yY][eE][sS]|[yY] ) generate_keys=true; break;;
      [nN][oO]|[nN] ) generate_keys=false; break;;
      * ) warning "Please answer yes [Y/y] or no [N/n].";;
    esac
  done
else
  generate_keys=true
fi
if $generate_keys; then
  if $private_key_exists; then
    info "Making a backup of private SSH key..."
    #cp $private_key $backup_location
  fi
  if $public_key_exists; then
    info "Making a backup of public SSH key..."
    #cp $public_key $backup_location
  fi
  info "Generating new SSH keys..."
  get_email
  ssh-keygen -t rsa -b 4096 -C $email
fi

# Start the ssh-agent
eval "$(ssh-agent -s)"

# Add SSH private key to the ssh-agent
ssh-add -K ~/.ssh/id_rsa

