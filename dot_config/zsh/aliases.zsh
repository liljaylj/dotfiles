# Aliases
alias sudo='sudo '
alias ls='ls --color --group-directories-first'
alias l='ls'
alias la='ls -lA'
alias ll='ls -l'
alias dir='la'
alias lsd='lsd --group-dirs first'
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
alias ki='k -n invoices'
alias kw='k -n wallet'
alias kip='k config use-context invoices-prod'
alias kwp='k config use-context wallet-prod'
alias kx='kubectx'
alias kn='kubens'
alias uks='source ~/bin/use-kubectl-system'
alias uk164='source ~/bin/use-kubectl-1.6.4'
alias uka='source ~/bin/use-kubectl-aws'
alias vpn='sudo openvpn --config ~/Documents/arch-dell.ovpn &'
alias info='info --vi-keys'
alias open='xdg-open'
alias lg='lazygit'
alias ch='chezmoi'

# TODO: remove when wayland support lands
alias code='GDK_BACKEND=x11 code'
alias marktext='GDK_BACKEND=x11 marktext'

if [ $(find ~/.aliases.d -type f | wc -l) -gt 0 ]; then
	for f in ~/.aliases.d/*
	do
		source $f
	done
fi
