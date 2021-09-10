# Get an e-mail address from the user
get_email () {
  valid_email=false
  until $valid_email; do
    echo
    read -p "E-mail address: " email
    if is_valid_email $email; then
      valid_email=true
    else
      warning "Invalid e-mail address"
    fi
  done
}

