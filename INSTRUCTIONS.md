# Instructions

**A work in progress...**

Full instructions written primarily for my own benefit.

## Software

Software used in my personal setup:

- OS X 10.11 El Capitan
- [iTerm](https://www.iterm2.com/) (currently using version 3)
- [Atom](https://atom.io/) (required for some of the aliases in `alias.sh`)
- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://vagrantup.com/)

## Terminal Settings

## Prerequisites

1. Install the Xcode command line tools:

        xcode-select --install

1. Install [Homebrew](http://brew.sh/):

        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

1. Install [Git](https://git-scm.com/) (via Homebrew):

        brew install git

## Bash Setup

1. Clone the [`bash`](https://github.com/natedillon/bash) repo:

        git clone git@github.com:natedillon/bash.git

## Development Tools

1. **(?)** Install Ruby:

        brew install ruby

1. [Sass](http://sass-lang.com/):

        gem install sass

1. [Compass](http://compass-style.org/):

        gem update --system; gem install compass

1. Install [npm](https://www.npmjs.com/).
1. Install [Grunt](http://gruntjs.com/):

        npm install -g grunt-cli

## To-Do

- Terminal settings
- SSH keys
- `.bash_profile`

        if [ -f ~/.bash/init.sh ]; then
            source ~/.bash/init.sh
        fi

- `.gitconfig`
- `.editorconfig`
- K-State OME Python VM:
    - `.ksu_config`
- Atom configuration

### Older To-Do List

- rbenv in .bash_profile
- Vagrant
    - vagrant-librarian-chef
    - vagrant-hostmanager
    - vagrant-list
- Chef
    - librarian-chef
- aliases:
    - VBoxManage list runningvms
	- VBoxManage controlvm <uuid> poweroff
	- VBoxManage unregistervm <uuid>
- documentation:
    - [Vagrant is easy - Chef is hard.](http://adamcod.es/2013/01/15/vagrant-is-easy-chef-is-hard.html)
    - [Vagrant is easy - Chef is hard (Part 2).](http://adamcod.es/2013/01/15/vagrant-is-easy-chef-is-hard-part2.html)
    - [The One Thing I Wish I Knew When Starting To Use Chef](http://adamcod.es/2013/08/27/one-thing-i-wish-i-knew-opscode-chef.html)
	- [How to create a virtual host with vagrant and chef](http://stackoverflow.com/questions/16568924/how-to-create-a-virtual-host-with-vagrant-and-chef)
	- [How do I destroy a VM when I deleted the .vagrant file?](http://stackoverflow.com/questions/15408969/how-do-i-destroy-a-vm-when-i-deleted-the-vagrant-file)
	- [WordCamp Yes, Vagrant Rocks #wcyvr](http://jeremyfelt.com/code/2013/08/17/wordcamp-yes-vagrant-rocks-wcyvr/)
	- [Opscode Public Cookbooks](https://github.com/opscode-cookbooks)
	- http://docs.opscode.com/essentials_cookbook_definitions.html
- reasearch:
    - [roderik/dotfiles](https://github.com/roderik/dotfiles)
- export EDITOR='subl -w'
