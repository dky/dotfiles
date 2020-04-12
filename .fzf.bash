# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
	export PATH="$PATH:$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings, Load customized keybindings from dotfiles
# ------------
source "$HOME/.dotfiles/fzf-key-bindings.bash"

#determines search program for fzf
#This is only called if you use fzf command directly, won't be called with ctrl-t
#Overrides for ctrl-t are in the fzf-key-bindings.bash above to exclude search dirs.
#ag = silver_searcher/rg = ripgrep
if type ag &> /dev/null; then
	export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
#refer rg over ag
if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
