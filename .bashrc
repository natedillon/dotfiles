# ===============================================
#
# ~/.bashrc
#
# =============================================== 


# Variables
# ----------------------

# Colors
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
BLUE_LIGHT="\[\033[1;34m\]"
BROWN="\[\033[0;33m\]"
CYAN="\[\033[0;36m\]"
CYAN_LIGHT="\[\033[1;36m\]"
GRAY_LIGHT="\[\033[0;37m\]"
GRAY_DARK="\[\033[1;30m\]"
GREEN="\[\033[0;32m\]"
GREEN_LIGHT="\[\033[1;32m\]"
RED="\[\033[0;31m\]"
RED_LIGHT="\[\033[1;31m\]"
PURPLE="\[\033[0;35m\]"
PURPLE_LIGHT="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[0;37m\]"
WHITE_BOLD="\[\033[1;37m\]"
COLOR_NONE="\[\e[0m\]"


# Prompt
# ----------------------

# Apple default: PS1='\h:\W \u\$ '

# Size PWD (http://www.debian-administration.org/article/548/Controlling_the_size_of_the_PWD_in_bash)
function truncate_pwd {
	if [ "$HOME" == "$PWD" ]
	then
		newPWD="~"
	elif [ "$HOME" ==  "${PWD:0:${#HOME}}" ]
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
	
	# Virtual Env (http://engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html)
	if [[ $VIRTUAL_ENV != "" ]]
	then
		venv="\n${PURPLE}(${VIRTUAL_ENV##*/}) "
	else
		venv=''
	fi
	
	#export PS1='\n\[$(tput setaf 6)\]\h\[$(tput sgr0)\]:\[$(tput setaf 3)\]${newPWD}\n\[$(tput setaf 2)\]\u\[$(tput sgr0)\] :: '
	export PS1="${venv}\n${CYAN}\h${WHITE}:${YELLOW}${newPWD}\n${GREEN}\u${WHITE} :: "
}

PROMPT_COMMAND=set_prompt


# Aliases
# ----------------------

# fab
alias fab="fab -f conf/fabfile.py"

# l
alias l="ls -al"
