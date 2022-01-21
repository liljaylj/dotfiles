# Aliases
alias sudo='sudo '
alias lsd='lsd --group-dirs=first'
if [[ -n $UNICODE_256_COLOR ]]
then
    alias ls='lsd'
else
    alias ls='lsd --icon=never'
fi
alias l='ls'
alias la='ls -lA'
alias ll='ls -l'
alias dir='la'
alias tree='lsd --tree'
alias grep='grep --color'
alias tm='tmux a -t main-session || tmux new -s main-session'
alias v='nvim'
alias gic='git -C'
alias k='kubectl'
alias kg='k get'
alias kgp='kg pods'
alias kl='k logs'
alias kex='k exec -it'
alias kdp='k delete po'
alias kx='k ctx'
alias kn='k ns'
alias info='info --vi-keys'
alias open='xdg-open'
alias lg='lazygit'
alias ch='chezmoi'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias cdx='cd "$(xplr)"'

# TODO: remove when wayland support lands
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland --no-sandbox --unity-launch'
alias marktext='GDK_BACKEND=x11 marktext'

# load aliases from aliases.d dir
if [ -d "$ZDOTDIR/aliases.d" ] && [ -r "$ZDOTDIR/aliases.d" ]
then
    while read -r f
    do
        source "$f"
    done < <(find -L "$ZDOTDIR/aliases.d" -mindepth 1 -maxdepth 1 -name '*.zsh' -type f)
fi
