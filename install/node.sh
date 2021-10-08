#
# Node
#

cd "$(dirname "$0")"
cd ../functions
source ./alerts.sh
cd - > /dev/null

name="Node"

# Check for nvm
if [ -f "$HOME/.nvm/nvm.sh" ]; then
  source $HOME/.nvm/nvm.sh
fi
if ! command -v nvm &> /dev/null; then
  echo
  info "Node Version Manager not installed"
  ./nvm.sh
fi

echo
info "Checking for $name..."
if command -v node &> /dev/null; then
  info "Already installed"
  info "Updating..."
else
  info "Installing..."
fi
nvm install node

# Remove nvm cache files
nvm cache clear
