# ===============================================
#
# ~/.bashrc
#
# =============================================== 


# Variables
# ----------------------

# Colors
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"


# Prompt
# ----------------------

# Apple default:
#   PS1='\h:\W \u\$ '

# http://www.debian-administration.org/article/548/Controlling_the_size_of_the_PWD_in_bash
function truncate_pwd {
	if [ $HOME == $PWD ]
	then
		newPWD="~"
	elif [ $HOME ==  ${PWD:0:${#HOME}} ]
	then
		newPWD="~${PWD:${#HOME}}"
	else
		newPWD=$PWD
	fi

	local pwdMaxLength=50
	if [ ${#newPWD} -gt $pwdMaxLength ]
	then
		local pwdHalfLength=$(( $pwdMaxLength / 2  ))
		newPWD="${newPWD:0:$(( $pwdHalfLength - 3 ))}...${newPWD:${#newPWD}-$pwdHalfLength}"
	fi
}


function set_prompt() {
	truncate_pwd
	
	export PS1='\n\[$(tput setaf 6)\]\h\[$(tput sgr0)\]:\[$(tput setaf 3)\]${newPWD}\n\[$(tput setaf 2)\]\u\[$(tput sgr0)\] :: '
}

PROMPT_COMMAND=set_prompt


# Aliases
# ----------------------

# l
alias l="ls -al"

# fab
alias fab="fab -f conf/fabfile.py"
