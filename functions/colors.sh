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
