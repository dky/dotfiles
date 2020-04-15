# Setup fzf
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
	export PATH="$PATH:$HOME/.fzf/bin"
fi

# Auto-completion, use the default from fzf installation
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings, Load customized keybindings from dotfiles with excluded directories
# Customizations are handled in .dotfiles/.fzf/key-bindings.bash
source "$HOME/.dotfiles/.fzf/key-bindings.bash"

# Which search program to use for fzf
# This is only used if you use fzf command from shell, won't be called with ctrl-t
# rg = ripgrep
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
