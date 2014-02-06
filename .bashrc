export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '

shopt -s histappend

# custom aliases
alias ll="ls -lGa"
alias lh="ls -lGah"
alias hs="history"

# screen aliases 
alias sls="screen -ls"
alias sr="screen -r"
alias ss="screen -S"

# tmux aliases 
alias tn="tmux new -s $1"
alias ta="tmux attach -t $1"
alias tls="tmux ls"

# git 
alias cdgit="cd ~/git"
alias gi='git init'
alias ga='git add'
alias gp='git push'
alias gpt="git push tfs master"
alias gl='git log --pretty --pretty=oneline'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias grv='git remote -v'
alias gptfsp='git push tfs master'
alias gco='git checkout'
alias gbl='git branch -v'

#vim alias
alias vi="vim"

#less with color
#alias ls="ls --color=always"
