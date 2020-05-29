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
  blue "$@"
}

success () {
  green "$@"
}

warning () {
  yellow "$@"
}

error () {
  red "$@"
}

# Get a name from the user
get_name () {
  while [ -z "$name" ]; do
    echo
    read -p "Name: " name
    if is_empty $name; then
      warning "Please enter a name"
    fi
  done
}

# Get an e-mail address from the user
get_email () {
  valid_email=false
  until $valid_email; do
    echo
    read -p "E-mail address: " email
    if is_valid_email $email; then
      valid_email=true
    else
      warning "Invalid e-mail address"
    fi
  done
}

# Get K-State eID from the user
get_eid () {
  while [ -z "$eid" ]; do
    echo
    read -p "K-State eID: " eid
    if is_empty $eid; then
      warning "Please enter your K-State eID"
    fi
  done
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
