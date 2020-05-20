#!/bin/bash

source ../functions/colors.sh
source ../functions/alerts.sh

# Get an e-mail address from the user
read_email () {
  echo
  read -p "E-mail address: " email
  validate_email
}

# Check to see if a string is empty
is_empty () {
  if [ -z "$1" ]; then
    return 0
  else
    return 1
  fi
}

# Check to see if a string is a valid e-mail address
is_valid_email () {
  if echo $1 | grep '^[a-zA-Z0-9._%+-]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*$' >/dev/null; then
    return 0
  else
    return 1
  fi
}


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
