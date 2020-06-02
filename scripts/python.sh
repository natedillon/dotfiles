#!/bin/bash

set -eo pipefail

source ./functions.sh

info "Running the K-State Python setup..."

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

# Git
# TODO: Check for Git and install it if needed

# Python
# TODO: This assumes a Homebrew install of Python. Instead, it should check for any install of Python 3.
info "Checking for Homebrew Python..."
if hash brew info python 2>/dev/null; then
  success "Homebrew Python is installed"
else
  info "Installing Homebrew Python..."
  brew install python
fi

# Vagrant
info "Checking for Vagrant..."
if hash vagrant 2>/dev/null; then
  success "Vagrant is installed"
else
  info "Installing Vagrant..."
  brew cask install vagrant
fi

# VirtualBox
# TODO: This fails on a new install because of macOS security. You need to allow the app in the system preferences before it can install.
#info "Checking for VirtualBox..."
#if hash brew cask info virtualbox 2>/dev/null; then
#  success "VirtualBox is installed"
#else
#  info "Installing VirtualBox..."
#  brew cask install virtualbox --no-quarantine
#fi

# Ansible
info "Checking for Ansible..."
if hash ansible 2>/dev/null; then
  success "Ansible is installed"
else
  info "Installing Ansible..."
  sudo -H pip3 install ansible
fi

# Configuration
info "Running Python VM configuration..."
ksu_config_location="$HOME/.ksu_config"
if [ ! -d "$ksu_config_location" ]; then
  info "Creating .ksu_config directory..."
  mkdir $ksu_config_location
else
  success "The .ksu_config directory directory already exists"
fi
code_directory="/home/vagrant/code"
if [ ! -f "$ksu_config_location/vars.yml" ]; then
  info "Creating vars.yml file..."
  # TODO: Name and e-mail address should be the ones used for Git/GitHub. Could these be pulled from .gitconfig?
  get_name
  get_email
  get_eid
  touch $ksu_config_location/vars.yml
  echo "code_directory: $code_directory" >> $ksu_config_location/vars.yml
  echo "git_email: $email" >> $ksu_config_location/vars.yml
  echo "git_name: $name" >> $ksu_config_location/vars.yml
  echo "eid: $eid" >> $ksu_config_location/vars.yml
  echo "ansible_python_interpreter: /usr/bin/python3" >> $ksu_config_location/vars.yml
else
  success "vars.yml already exists"
fi
info "To make changes to the configuration, edit the $ksu_config_location/vars.yml file"

# python-vm
info "Checking for the python-vm repository..."
if [ ! -d "$HOME/Projects/kstateome" ]; then
  info "Creating kstateome directory..."
  mkdir $HOME/Projects/kstateome
fi
if [ -d "$HOME/Projects/kstateome/python-vm" ]; then
  success "The python-vm repository is already cloned"
else
  info "Cloning the python-vm repository..."
  # TODO: Make sure $PROJECT_PATH is available
  # TODO: Set a global K-State project path in .zshrc?
  cd $HOME/Projects/kstateome
  git clone git@github.com:kstateome/python-vm.git
  cd -
fi

# Chef
info "Checking for Chef..."
if hash chef 2>/dev/null; then
  success "Chef is installed"
else
  info "Installing ChefDK..."
  brew cask install chef/chef/chefdk
fi

# Chef configuration
info "Running Chef configuration..."
if [ ! -d "$HOME/.chef" ]; then
  info "Creating .chef directory..."
  mkdir $HOME/.chef
else
  success "The .chef directory directory already exists"
fi
info "Copying configuration files..."
# TODO: Get project path from .zshrc?
cp $HOME/Projects/kstateome/python-vm/roles/users/chef/* $HOME/.chef
# TODO: Get username and home path
sed -i '' 's+/home/vagrant/+/Users/nate/+g' $HOME/.chef/knife.rb
# TODO: Need to check to make sure .ssh directory exists
cp $HOME/Projects/kstateome/python-vm/roles/users/ssh/id_fabric $HOME/.ssh

success "K-State Python setup complete!"
