# Xcode Command Line Developer Tools
# -------------------------

name="Xcode Command Line Developer Tools"

echo
info "Checking for $name..."
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}"; then
  info "Already installed"
else
  info "Installing..."
  xcode-select --install
fi
