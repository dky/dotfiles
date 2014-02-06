#PS1 prompt with git status

if [[ $EUID -ne 0 ]]; then
	tail="$"
else 
	tail="#"
fi

function color_my_prompt {
    local __user="\[\033[1;37m\]\u"
    local __asterisk="\[\033[0;36m\]@"
    local __host="\[\033[0;31m\]\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$tail"
    local __last_color="\[\033[00m\]"
    export PS1="$__user$__asterisk$__host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

color_my_prompt
export TERM=xterm-256color
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
