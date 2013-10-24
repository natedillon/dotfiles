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
