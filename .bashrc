export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export EDITOR=vim
#This is to silence the zsh banner in Catalina...
export BASH_SILENCE_DEPRECATION_WARNING=1

shopt -s histappend

export LANG=en_US.UTF-8
export PATH=$HOME/bin:$HOME/.dotfiles/bin:$HOME/go/bin:/usr/local/sbin:/usr/local/go/bin:$HOME/.local/bin:$PATH

# Tell python to stop writing __pycache__ dirs all over the place.
export PYTHONDONTWRITEBYTECODE=1


[ -f ~/.fzf/bin/fzf -o -f /usr/local/bin/fzf ] && source ~/.fzf.bash
[ -f ~/.custom_functions ] && source ~/.custom_functions
[ -f ~/.custom_aliases ] && source ~/.custom_aliases
[ -f ~/.dotfiles/z.sh ] && source ~/.dotfiles/z.sh

# Kubctl bash completions
if [ -x "$(command -v kubectl)" ]; then
	source <(kubectl completion bash)
fi

# Don't exit the shell on ctrl+d
shopt -s -o ignoreeof
