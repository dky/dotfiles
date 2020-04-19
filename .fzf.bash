# Setup fzf
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
	export PATH="$PATH:$HOME/.fzf/bin"
fi

# Auto-completion, use the default from fzf installation
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings, Load customized keybindings from dotfiles with excluded directories
# Customizations are handled in .dotfiles/.fzf/key-bindings.bash
source "$HOME/.dotfiles/.fzf/key-bindings.bash"

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

export FZF_DEFAULT_OPTS='--height=90% --preview="cat {}" --preview-window=down:60%:wrap --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'

export FZF_DEFAULT_COMMAND="find . \
	\( -name Music -o -name logbook -o -name Library -o -name Pictures -o -name Public -o -name Movies -o -name Applications -o -name Downloads \) -prune \
	-o \( -name '.git' \) -prune \
	-o \( -path './go/bin/*' -o -path './go/pkg/*' \) -prune \
	-o \( -name '*.mp4' -o -name '*.mp3' -o -name '.DS_Store' -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.gz' -o -name '*.tgz' \) -prune \
	-o -type f -print"
