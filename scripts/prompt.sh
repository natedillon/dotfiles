# Prompt
# ----------------------

# Apple default: PS1='\h:\W \u\$ '

# Size PWD
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
	
	# Virtual Env
	if [[ $VIRTUAL_ENV != "" ]]
	then
		venv="\n${PURPLE}(${VIRTUAL_ENV##*/}) "
	else
		venv=''
	fi
	
	export PS1="${venv}\n${CYAN}\h${WHITE}:${YELLOW}${newPWD}\n${GREEN}\u${WHITE} :: "
}

PROMPT_COMMAND=set_prompt
