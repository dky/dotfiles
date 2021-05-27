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
	if [ -f "$HOME/.goenv" ]; then
		source "$HOME/.goenv"
	fi
	if [ -f "$HOME/bin/export" ]; then
		source $HOME/bin/export
	fi
	if [ -f "$HOME/lib/azure-cli" ]; then
		source "$HOME/lib/azure-cli/az.completion"
	fi
	# The next line updates PATH for the Google Cloud SDK.
	if [ -f "$HOME/Downloads/google-cloud-sdk/path.bash.inc" ]; then
		source "$HOME/Downloads/google-cloud-sdk/path.bash.inc"
	fi
	# The next line enables shell command completion for gcloud.
	if [ -f "$HOME/Downloads/google-cloud-sdk/completion.bash.inc" ]; then
		source "/Users/dky/Downloads/google-cloud-sdk/completion.bash.inc"
	fi
fi

if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
	fortune | cowsay
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
