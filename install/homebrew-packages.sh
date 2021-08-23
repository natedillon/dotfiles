# Homebrew packages
# -------------------------

name="Homebrew packages"

echo
info "Installing $name..."
brew bundle --verbose --no-lock --file="./brewfiles/Brewfile"
