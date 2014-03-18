## Requirements

- OS X 10.9 Mavericks
- Install Xcode command line tools by typing the following command in Terminal:
    
        xcode-select --install
    
- Git (use the version included with Xcode command line tools?)
- Python (use the version included with OS X?)
    - currently using 2.7.x included with OS X
- TextMate
    - required for alias.sh and .gitconfig
- Kaleidoscope
    - required for .gitconfig
- Dropbox
    - virtualenvwrapper project home is set to ~/Dropbox/Projects
    - cddropboxprojects alias points to ~/Dropbox/Projects

## Instructions

1. Clone the .bash repository.
1. Set up .gitconfig.
1. Terminal settings.

## K-State

1. pip
    
        sudo easy_install pip
    
1. [virtualenv](http://virtualenv.org/)
    
        pip install virtualenv
    
1. [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org/)
    
        pip install virtualenvwrapper
    
1. [Homebrew](http://brew.sh/)
    
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    
1. libjpeg with Homebrew
    
        brew install libjpeg
    
## Personal

1. VirtualBox
1. [Vagrant](http://vagrantup.com/)
1. rbenv (from the Chef installation instructions)
1. [Chef](http://getchef.com/)

## Other

- Sass
- Compass
    
        sudo gem install compass
		rbenv rehash
    
        sudo gem install compass --pre
		rbenv rehash
