# Check to see if a string is a valid e-mail address
is_valid_email () {
  if echo $1 | grep '^[a-zA-Z0-9._%+-]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*$' >/dev/null; then
    return 0
  else
    return 1
  fi
}
