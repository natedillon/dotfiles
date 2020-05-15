#!/bin/bash

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
