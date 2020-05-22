#!/bin/bash

set -eo pipefail

source ./functions/colors.sh
source ./functions/alerts.sh

echo
yellow "=========================================="
blue   "  natedillon/dotfiles"
echo   "  https://github.com/natedillon/dotfiles"
yellow "=========================================="

# Installer function
dotfiles_installer () {

  # Xcode Command Line Developer Tools
  info "Checking for Xcode Command Line Developer Tools..."
  if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}"; then
    success "Xcode Command Line Developer Tools are installed"
  else
    info "Installing Xcode Command Line Developer Tools..."
    xcode-select --install
  fi

  # Homebrew
  info "Checking for Homebrew..."
  if hash brew 2>/dev/null; then
    success "Homebrew is installed"
    info "Updating Homebrew..."
    brew update
  else
    info "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Homebrew packages
  info "Installing Homebrew packages..."
  brew tap homebrew/bundle
  brew bundle --verbose --file="./brewfiles/Brewfile"

  # Homebrew Mac App Store apps
  info "Installing Mac App Store apps..."
  brew bundle --verbose --file="./brewfiles/Brewfile.mas"

  # Homebrew casks
  info "Installing Homebrew casks..."
  brew bundle --verbose --file="./brewfiles/Brewfile.casks"

  # git-lfs
  info "Setting up git-lfs..."
  git lfs install

  # Oh My Zsh
  info "Checking for Oh My Zsh..."
  if [ -d "$HOME/.oh-my-zsh" ]; then
    success "Oh My Zsh is installed"
    info "Updating Oh My Zsh..."
    upgrade_oh_my_zsh
  else
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  # Grunt
  info "Installing Grunt..."
  npm install -g grunt-cli

  # Drush launcher
  info "Checking for Drush launcher..."
  if hash drush 2>/dev/null; then
    success "Drush launcher is installed"
  else
    info "Installing Drush launcher..."
    cd $HOME
    curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
    chmod +x drush.phar
    sudo mv drush.phar /usr/local/bin/drush
    cd -
  fi

  # GitHub SSH
  #https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  #https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account

  # Local development setup
  # https://ntdln.com/2018/12/20/macos-local-development-setup/

  # Copy Apache config file
  #backup files
  #cp config/apache2/httpd.conf /etc/apache2
  #cp config/apache2/extra/httpd-userdir.conf /etc/apache2/extra
  #cp config/apache2/users/nate.conf /etc/apache2/users
  #sudo apachectl restart

  # Copy PHP config file
  #backup file
  #cp config/php/7.4/php.ini /usr/local/etc/php/7.4

  # MariaDB
  #info "Running MySQL setup..."
  #sudo /usr/local/bin/mysql_secure_installation

  # Copy .zshrc to home directory
  #cp .zshrc $HOME
  #source $HOME/.zshrc

}


# Confirm the user would like to run the installer
echo
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  run_installer=true
else
  while true; do
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n): " input
    case $input in
      [yY][eE][sS]|[yY] ) run_installer=true; break;;
      [nN][oO]|[nN] ) run_installer=false; break;;
      * ) warning "Please answer yes [Y/y] or no [N/n].";;
    esac
  done
fi

# Run the installer
if $run_installer; then
  info "Running the installer..."
  dotfiles_installer
fi
