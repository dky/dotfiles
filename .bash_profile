# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi
if [ -f "$HOME/.dot_private" ]; then
	source "$HOME/.dot_private"
fi
if [ -f "$HOME/.goenv" ]; then
	source "$HOME/.goenv"
fi
if [ -f "$HOME/bin/export" ]; then
	source "$HOME/bin/export"
fi
if [ -f "$HOME/lib/azure-cli/az.completion" ]; then
	source "$HOME/lib/azure-cli/az.completion"
fi
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.bash.inc" ]; then
	source "$HOME/Downloads/google-cloud-sdk/path.bash.inc"
fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.bash.inc" ]; then
	source "$HOME/Downloads/google-cloud-sdk/completion.bash.inc"
fi

if command -v fortune >/dev/null && command -v cowsay >/dev/null; then
	fortune | cowsay
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.bash 2>/dev/null || :
