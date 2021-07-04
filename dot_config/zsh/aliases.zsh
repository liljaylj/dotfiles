# Aliases
alias sudo='sudo '
alias lsd='lsd --group-dirs=first'
alias ls='lsd'
# alias ls='ls --color --group-directories-first'
alias l='ls'
alias la='ls -lA'
alias ll='ls -l'
alias dir='la'
alias grep='grep --color'
alias manage='python manage.py'
# alias npm='pnpm'
alias artisan='php artisan'
alias tm='tmux a -t main-session || tmux new -s main-session'
alias v='nvim'
alias y='yay -Syu'
alias yy='y -y'
alias yys='sudo pacman-key --refresh-keys && yy'
alias gic='git -C'
alias subl='subl3'
alias k='kubectl'
alias kgp='k get pods'
alias kl='k logs'
alias kex='k exec -it'
alias kdp='k delete po'
alias kx='k ctx'
alias kn='k ns'
alias uks='source ~/bin/use-kubectl-system'
alias uk164='source ~/bin/use-kubectl-1.6.4'
alias uka='source ~/bin/use-kubectl-aws'
alias vpn='sudo openvpn --config ~/Documents/arch-dell.ovpn &'
alias info='info --vi-keys'
alias open='xdg-open'
alias lg='lazygit'
alias ch='chezmoi'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# TODO: remove when wayland support lands
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland --no-sandbox --unity-launch'
alias marktext='GDK_BACKEND=x11 marktext'

# load aliases from aliases.d dir
if [ $(find "$ZDOTDIR/aliases.d" -type f | wc -l) -gt 0 ]; then
	for f in "$ZDOTDIR/aliases.d"/*.zsh
	do
		source "$f"
	done
fi
