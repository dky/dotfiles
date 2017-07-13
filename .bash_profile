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
	if [ -f "$HOME/.goenv" ]; then
		source "$HOME/.goenv"
	fi
	if [ -f $HOME/.venvburrito/startup.sh ]; then
		 . $HOME/.venvburrito/startup.sh
	fi
	if [ -f $HOME/bin/export ]; then
		 . $HOME/bin/export
	fi
	if [ -f $HOME/lib/azure-cli ]; then
		. '/Users/dky/lib/azure-cli/az.completion'
	fi
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dky/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/dky/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dky/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/dky/Downloads/google-cloud-sdk/completion.bash.inc'; fi
