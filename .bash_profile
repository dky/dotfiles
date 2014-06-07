if [[ $EUID -ne 0 ]]; then
	tail="$"
else 
	tail="#"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		source "$HOME/.bashrc"
		source "$HOME/.custom_aliases"
		source "$HOME/.custom_functions"
	fi
	if [ -f "$HOME/.dot_private" ]; then
		source "$HOME/.dot_private"
	fi

	if [ -f "$HOME/.rvm/scripts/rvm" ]; then
		source "$HOME/.rvm/scripts/rvm"
	fi

	if [ -f "$HOME/.splunk_custom" ]; then
		source "$HOME/.splunk_custom"
	fi
	if [ -f $HOME/.venvburrito/startup.sh ]; then
		 . $HOME/.venvburrito/startup.sh
	fi
fi

export TERM=xterm-256color
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'
export PATH=/usr/local/packer:/opt/tmux/bin:/opt/vim/bin:/opt/git/bin:$PATH:"/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool:/opt/node/bin"
