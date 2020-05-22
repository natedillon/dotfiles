#!/bin/bash

source ./functions.sh


# .gitconfig
# -------------------------

# Get name
while [ -z "$name" ]; do
  echo
  read -p "Name: " name
  if is_empty $name; then
    warning "Please enter a name"
  fi
done

# Get e-mail address
valid_email="false"
until [ $valid_email = "true" ]; do
  echo
  read -p "E-mail address: " email
  if is_valid_email $email; then
    valid_email="true"
  else
    warning "Invalid e-mail address"
  fi
done

# Set name and e-mail address in .gitconfig
git config --global user.name "$name"
git config --global user.email "$email"
