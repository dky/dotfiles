export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export EDITOR=vim
shopt -s histappend

export TERM=xterm-256color
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'
export PATH=$PATH:$HOME/.rvm/bin:$HOME/bin:"/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool":/usr/local/packer:/usr/local/terraform:/opt/tmux/bin:/opt/vim/bin:/opt/git/bin:/opt/node/bin:/usr/local/opt/go/libexec/bin
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
