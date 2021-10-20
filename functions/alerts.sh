#
# Alert functions
#

source ./colors.sh

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
