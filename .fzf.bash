# Setup fzf
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
	export PATH="$PATH:$HOME/.fzf/bin"
fi

# Auto-completion, use the default from fzf installation
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings, Load customized keybindings from dotfiles with excluded directories
# Customizations are handled in .dotfiles/.fzf/key-bindings.bash
source "$HOME/.dotfiles/.fzf.key-bindings.bash"

fzf_then_open_in_editor() {
	local file=$(fzf-tmux)
	# Open the file if it exists
	if [ -n "$file" ]; then
		# Use the default editor if it's defined, otherwise Vim
		${EDITOR:-vim} "$file"
	fi
}

# Disable ctr-t in .fzf/key-bindings.bash and override with this function which opens a file directly in vim when ctrl-t is used.
bind -x '"\C-t": fzf_then_open_in_editor'

# Rely on bat command `brew install bat` for preview syntax highlighting
export FZF_DEFAULT_OPTS='--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview "bat --color=always --style=header,grid --line-range :300 {}"'
#export FZF_DEFAULT_OPTS='--height=90% --preview="cat {}" --preview-window=down:60%:wrap --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'

# Files I don't want to see this applies to vim as well...
export FZF_FIND_EXCLUDE="\( -name Music -o -name logbook -o -name Library -o -name Pictures -o -name Public -o -name Movies -o -name Applications -o -name Downloads \) -prune \
	-o \( -name '.git' -o -name 'venv' -o -name '__init__.py' -o -name '.pytest_cache' \) -prune \
	-o \( -path './go/bin/*' -o -path './go/pkg/*' -o -path './.vim/plugged/*' -o -path './.vim/view/*' -o -path './.local/share/nvim/view/*' -o -path './go/src/*' -o -path './iCloud*/*' -o -path './google-cloud-sdk/*' -o -path './tmp/*' -o -path './Documents/*' -o -path './Desktop/*' -o -path './git/dky.io/*' -o -path './git/docker/*' -o -path './git/kinesis-qmk/*' -o -path './.npm' -o -path './.pyenv' -o -path './.fzf' -o -path './.templateengine' -o -path './.bash_sessions' -o -path './.cache' -o -path './node_modules' -o -path './volumes' \) -prune \
	-o \( -name '*.mp4' -o -name '*.mp3' -o -name '.DS_Store' -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.gz' -o -name '*.tgz' -o -name '*.ipa' -o -name '*.apk' -o -name '*.pyc' -o -name '*.sqlite' -o -name '*.ico' -o -name '*.rpm' -o -name '*.deb' -o -name '*.zip' \) -prune"

export FZF_DEFAULT_COMMAND="find . \
	$FZF_FIND_EXCLUDE \
	-o -type f -print"
