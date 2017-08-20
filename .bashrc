export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export EDITOR=vim
shopt -s histappend

export TERM=xterm-256color
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'
export PATH=$HOME/bin:/usr/local/sbin:$PATH
