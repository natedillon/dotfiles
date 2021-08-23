# Oh My Zsh
# -------------------------

name="Oh My Zsh"

echo
info "Checking for $name..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  info "Already installed"
  info "Updating..."
  env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
else
  info "Installing..."
  0>/dev/null sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
