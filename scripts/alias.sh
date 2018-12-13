# Aliases
# ----------------------

# l
alias ll="ls -alFh"

# c
alias c="clear"

# edit
alias edit="atom"

# fab
alias fab="fab -f conf/fabfile.py"

# Composer
alias composer='php ~/composer.phar'

# Apache
alias start-apache='sudo apachectl start'
alias stop-apache='sudo apachectl stop'
alias restart-apache='sudo apachectl restart'

# Config files
alias config-apache="sudo atom /etc/apache2/httpd.conf"
alias config-apache-users="sudo atom /etc/apache2/users/"
alias config-hosts="sudo atom /etc/hosts"
alias config-vhosts="sudo atom /private/etc/apache2/extra/httpd-vhosts.conf"
alias config-php="sudo atom /etc/php.ini"
