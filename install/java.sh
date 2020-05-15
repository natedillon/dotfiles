#!/bin/bash

source ../functions/colors.sh
source ../functions/alerts.sh

info "Running K-State Java setup"

# Ask to install IntelliJ
while true; do
  read -p "Would you like to install IntelliJ IDEA Community Edition? [y/n]: " input
  case $input in
    [yY][eE][sS]|[yY] ) install_intellij=true; break;;
    [nN][oO]|[nN] ) install_intellij=false; break;;
    * ) echo "Please answer yes (Y/y) or no (N/n).";;
  esac
done
echo $install_intellij

# Set Java VM path
java_vm_path="$PROJECT_PATH/kstateome/java-vm"
if [ ! -d "$java_vm_path" ]; then
  mkdir "$java_vm_path"
fi

# Install Vagrant
if hash vagrant 2>/dev/null; then
  echo "Vagrant is already installed"
else
  echo "Installing Vagrant"
fi

# Install ChefDK
if brew ls --versions chefdk 2>/dev/null; then
  echo "Java is already installed"
else
  echo "Installing ChefDK"
fi

# Install Vagrant plugins

# Clone the repositories

# Create symlinks
create_symlink () {
  source=$1
  link=$2
  if [ -L $link ]; then
    echo "symlink already exists"
  elif [ ! -d "$path" ]; then
    echo "Repository not found"
  else
    echo "Creating symlink"
  fi
}
create_symlink $java_vm_path/ome_chef_data/data_bags $java_vm_path/data_bags
create_symlink $java_vm_path/ome_chef_data/environments $java_vm_path/environments
create_symlink $java_vm_path/ome_chef_data/roles $java_vm_path/roles

# Install OpenJDK
if /usr/libexec/java_home -v 2>/dev/null; then
  echo "Java SDK is already installed"
else
  echo "Installing OpenJDK"
fi

# Install Maven
if hash mvn 2>/dev/null; then
  echo "Maven is already installed"
else
  echo "Installing Maven"
fi

# Copy Maven settings to user directory

# Install IntelliJ IDEA Community Edition
if $install_intellij; then
  echo "Installing IntelliJ IDEA Community Edition"
else
  echo "Skipping IntelliJ"
fi
