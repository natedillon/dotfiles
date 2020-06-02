#!/bin/bash

set -eo pipefail

source ./functions.sh

info "Running the K-State Java setup..."

# Options
java_vm_path="$PROJECT_PATH/kstateome/java-vm"
java_vm_chef_path="$java_vm_path/chef"

# Homebrew
info "Updating Homebrew..."
brew update

# Java VM directory
info "Checking for the Java VM directory..."
if [ -d "$java_vm_path" ]; then
  success "The Java VM directory exists"
else
  info "Creating the Java VM directory..."
  mkdir "$java_vm_path"
fi

# Chef directory
if [ -d "$java_vm_chef_path" ]; then
  success "The Chef directory exists"
else
  info "Creating the Chef directory..."
  mkdir "$java_vm_chef_path"
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
# TODO: Check for VirtualBox and install if necessary

# Chef
info "Checking for Chef..."
if hash chef 2>/dev/null; then
  success "Chef is installed"
else
  info "Installing ChefDK..."
  brew cask install chef/chef/chefdk
fi

# Vagrant plugins
info "Installing Vagrant plugins..."
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus

# ome_chef_data
info "Checking for the ome_chef_data repository..."
if [ -d "$java_vm_path/ome_chef_data" ]; then
  success "The ome_chef_data repository is already cloned"
else
  info "Cloning the ome_chef_data repository..."
  cd $java_vm_path
  git clone git@github.com:kstateome/ome_chef_data.git
  cd -
fi

# ome_wildfly_cluster
info "Checking for the ome_wildfly_cluster repository..."
if [ -d "$java_vm_chef_path/ome_wildfly_cluster" ]; then
  success "The ome_wildfly_cluster repository is already cloned"
else
  info "Cloning the ome_wildfly_cluster repository..."
  cd $java_vm_chef_path
  git clone git@github.com:kstateome/ome_wildfly_cluster.git
  cd -
fi

# Symlinks
create_symlink () {
  name=$1
  source=$2
  link=$3
  info "Checking for the $name symlink..."
  if [ -L $link ]; then
    success "The symlink already exists"
  elif [ ! -d "$path" ]; then
    error "Repository not found. Please clone the ome_chef_data repository before creating the symlink."
  else
    info "Creating symlink..."
  fi
}
create_symlink data_bags $java_vm_path/ome_chef_data/data_bags $java_vm_path/data_bags
create_symlink environments $java_vm_path/ome_chef_data/environments $java_vm_path/environments
create_symlink roles $java_vm_path/ome_chef_data/roles $java_vm_path/roles

# OpenJDK
if /usr/libexec/java_home -v 2>/dev/null; then
  success "Java SDK is installed..."
else
  info "Installing OpenJDK..."
  brew cask install adoptopenjdk8
fi

# Maven
if hash mvn 2>/dev/null; then
  success "Maven is installed"
else
  info "Installing Maven..."
  brew install maven
fi

# IntelliJ IDEA Community Edition
info "Checking for IntelliJ IDEA Community Edition..."
if hash brew cask info intellij-idea-ce 2>/dev/null; then
  while true; do
    read -p "Would you like to install IntelliJ IDEA Community Edition? [y/n]: " input
    case $input in
      [yY][eE][sS]|[yY] ) install_intellij=true; break;;
      [nN][oO]|[nN] ) install_intellij=false; break;;
      * ) echo "Please answer yes [Y/y] or no [N/n].";;
    esac
  done
  if $install_intellij; then
    info "Installing IntelliJ IDEA Community Edition..."
    brew cask install intellij-idea-ce
  fi
else
  success "IntelliJ IDEA Community Edition is installed"
fi
