export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export EDITOR=vim
#This is to silence the zsh banner in Catalina...
export BASH_SILENCE_DEPRECATION_WARNING=1

shopt -s histappend

export LANG=en_US.UTF-8
export PATH=$HOME/bin:$HOME/go/bin:/usr/local/sbin:/usr/local/go/bin:$HOME/.local/bin:$PATH

[ -f ~/.fzf/bin/fzf -o -f /usr/local/bin/fzf ] && source ~/.fzf.bash
[ -f ~/.custom_functions ] && source ~/.custom_functions
[ -f ~/.dotfiles/z.sh ] && source ~/.dotfiles/z.sh
