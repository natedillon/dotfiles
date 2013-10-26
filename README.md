# .bash

My personal bash files for OS X.

![Screenshot](screenshot.png)

## Instructions

Clone this repository to '~/.bash' and add the following line to your '~/.bash_profile' or equivalent file:

    if [ -f ~/.bash/init.sh ]; then
        source ~/.bash/init.sh
    fi

## Credits

Portions of this code was taken from or inspired by the following:

- [fnando/bash](https://github.com/fnando/bash)
- [Controlling the size of the $PWD in bash](http://www.debian-administration.org/article/548/Controlling_the_size_of_the_PWD_in_bash)
- [Show current virtualenv on bash prompt](http://engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html)