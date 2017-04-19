export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export EDITOR=vim
shopt -s histappend

export TERM=xterm-256color
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'
export PATH=$HOME/.linuxbrew/bin:$HOME/.rvm/bin:$HOME/bin:"/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool":/usr/local/packer:/usr/local/terraform:/opt/tmux/bin:/opt/node/bin:/usr/local/heroku/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin:/usr/local/go/bin:/opt/puppetlabs/bin:$HOME/go/bin:$HOME/google-cloud-sdk/bin:$PATH

export PATH=$PATH:/Users/dky/bin
