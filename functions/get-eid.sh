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

