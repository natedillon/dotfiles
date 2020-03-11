#!/bin/bash

blue () {
  tput setaf 4
  echo "$*"
  tput sgr0
}

green () {
  tput setaf 2
  echo "$*"
  tput sgr0
}

yellow () {
  tput setaf 3
  echo "$*"
  tput sgr0
}

red () {
  tput setaf 1
  echo "$*"
  tput sgr0
}

info () {
  echo
  blue "$@"
}

success () {
  echo
  green "$@"
}

warning () {
  echo
  yellow "$@"
}

error () {
  echo
  red "$@"
}

read_email () {
  echo
  read -p "E-mail address: " email
  validate_email
}

is_empty () {
  if [ -z "$1" ]; then
    return 0
  else
    return 1
  fi
}

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
