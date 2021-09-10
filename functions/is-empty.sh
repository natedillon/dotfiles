# Check to see if a string is empty
is_empty () {
  if [ -z "$1" ]; then
    return 0
  else
    return 1
  fi
}

