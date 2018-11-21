export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export EDITOR=vim
shopt -s histappend

export TERM=xterm-256color
export PATH=$HOME/bin:$HOME/go/bin:/usr/local/sbin:/usr/local/go/bin:$PATH

complete -C /usr/local/bin/vault vault

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.custom_functions ] && source ~/.custom_functions
