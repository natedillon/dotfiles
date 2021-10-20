#
# Color functions
#

blue () {
  tput setaf 4
  printf "$*\n"
  tput sgr0
}

green () {
  tput setaf 2
  printf "$*\n"
  tput sgr0
}

yellow () {
  tput setaf 3
  printf "$*\n"
  tput sgr0
}

red () {
  tput setaf 1
  printf "$*\n"
  tput sgr0
}
