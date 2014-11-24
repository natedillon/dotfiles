# bash

My personal bash files and settings for OS X.

![Screenshot](screenshot.png)

## Instructions

Clone this repository to '~/.bash' and add the following line to your '~/.bash_profile' or equivalent file:

    if [ -f ~/.bash/init.sh ]; then
        source ~/.bash/init.sh
    fi

## Credits

Portions of this code was taken from or inspired by the following:

- [fnando/bash](https://github.com/fnando/bash)
- [jonfaustman/.bashrc](https://github.com/jonfaustman/.bashrc)
- [Controlling the size of the $PWD in bash](http://www.debian-administration.org/article/548/Controlling_the_size_of_the_PWD_in_bash)
- [Show current virtualenv on bash prompt](http://engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html)

## Extras

### Terminal Settings

To use my OS X Terminal app settings, go to the "Settings" tab in the preferences for the Terminal app, then import the "Nate.terminal" file (located in the "extras" folder).

### Git Configuration

To use my Git configuration, copy the ".gitconfig" file from the "extras" folder to "~/.gitconfig". Be sure to edit the file and set the name and e-mail address. My current Git editor-of-choice is TextMate, so you will need to have TextMate installed (with the "mate" command).

#### Git Configuration Resources

- [Git - Git Configuration](http://git-scm.com/book/en/Customizing-Git-Git-Configuration)
- [Atlassian Git Tutorial - The git config Command](https://www.atlassian.com/git/tutorial/git-basics#!config)
- [GitHub Help - Using Textmate as your default editor](https://help.github.com/articles/using-textmate-as-your-default-editor)
- [TextMate Manual - Calling TextMate from Other Applications](http://manual.macromates.com/en/using_textmate_from_terminal.html)

## To-Do

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
