# TODO: There is already a system command called 'info'
# It doesn't seem to conflict when the scripts are running though
# Options: alert_info, alrt_info, msg_info
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
