#
# Homebrew packages
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

name="Homebrew packages"

echo
info "Installing $name..."
brew bundle --verbose --no-lock --file="../brewfiles/Brewfile"
