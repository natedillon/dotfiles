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

