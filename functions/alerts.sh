#!/bin/bash

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
