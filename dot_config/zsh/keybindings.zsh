
# alt+b: cd to parent dir with fzf
bindkey '\en' cb

# edit command line in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
bindkey '^X^e' edit-command-line
