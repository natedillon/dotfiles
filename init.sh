# ===============================================
# ~/.bash
# Author: D. Nathan Dillon (http://natedillon.com)
# ===============================================


# Temporarily save the old values so we can restore them after execution
SOURCE_TEMP=$SOURCE
DIR_TEMP=$DIR

SOURCE="${BASH_SOURCE[0]}"
# Go through all symlinks to find the ultimate location of the source file
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
# Get an absolute path to the directory that contains this file
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


source $DIR/scripts/variables.sh
#source $DIR/scripts/virtualenv.sh
source $DIR/scripts/prompt.sh
source $DIR/scripts/alias.sh


# Restore old values
SOURCE=$SOURCE_TEMP
DIR=$DIR_TEMP


# Switch from built-in OS X Git to dowloadable version
if [ -f /usr/local/git/bin/git ]; then
    export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"
fi

# Java development settings
if [ -d /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Java Team VM settings
export CLUSTER_STANDALONE=true

# Use MAMP's PHP and other command line tools
export PATH=/Applications/MAMP/bin/php/php5.6.10/bin:$PATH
export PATH=/Applications/MAMP/Library/bin/:$PATH
