# virtualenv
# ----------------------

source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/Dropbox/Projects

# virtualenvwrapper
# passes arg to virtual env commands so it doesn't inherit any packages
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
