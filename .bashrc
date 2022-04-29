export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export EDITOR=nvim
#This is to silence the zsh banner in Catalina...
export BASH_SILENCE_DEPRECATION_WARNING=1

#Ansible no cows
export ANSIBLE_NOCOWS=1

shopt -s histappend

export LANG=en_US.UTF-8
export PATH=$HOME/bin:$HOME/.dotfiles/bin:$HOME/go/bin:/usr/local/sbin:/usr/local/go/bin:$HOME/.local/bin:/usr/local/opt/llvm/bin:$HOME/.yarn/bin:/opt/homebrew/bin:$HOME/.cargo/bin:$PATH

# Tell python to stop writing __pycache__ dirs all over the place.
export PYTHONDONTWRITEBYTECODE=1


[ -f ~/.fzf/bin/fzf -o -f /usr/local/bin/fzf ] && source ~/.fzf.bash
[ -f ~/.custom_functions ] && source ~/.custom_functions
[ -f ~/.custom_aliases ] && source ~/.custom_aliases
[ -f ~/.dotfiles/z.sh ] && source ~/.dotfiles/z.sh

# Kubctl bash completions
if [ -x "$(command -v kubectl)" ]; then
	source <(kubectl completion bash)
	# Add completion for k alias
	complete -F __start_kubectl k
fi

# Don't exit the shell on ctrl+d
shopt -s -o ignoreeof

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
	# Load up fzf settings in terminal
	export FZF_DEFAULT_OPTS=""
	source ~/.fzf.bash
	# If inside of floaterm just open the file in a new buffer using floaterm
	alias ni="floaterm"
	# make alias for e as well!
	alias e="floaterm"
	# https://thoughtbot.com/upcase/videos/neovim-remote-as-preferred-editor
	# Used my git commit - git commit gets ugly without this
	export VISUAL="nvr --remote-wait +'set bufhidden=wipe'"
else
	export VISUAL="nvim"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust cargo
[ -f ~/.cargo/env ] && . ~/.cargo/env

# Navi https://github.com/denisidoro/navi
export NAVI_CONFIG=~/.dotfiles/.navi/config.yaml
eval "$(navi widget bash)"
