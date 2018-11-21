# Setup fzf
# ---------
if [[ ! "$PATH" == */home/admin.dk/.fzf/bin* ]]; then
  export PATH="$PATH:/home/admin.dk/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/admin.dk/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/admin.dk/.fzf/shell/key-bindings.bash"

