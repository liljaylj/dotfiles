# git status with file marks
gits() {
    local prefix="${GIT_S_PREFIX:-e}"

    local n=0 x y fnum fname fnum2 fname2 e
    while true; do
        eval e=\$"$prefix""$((++n))"
        [[ -n "$e" ]] && unset "$prefix""$n" || break
    done
    n=0
    git status --porcelain=v2 | while read line; do
        case "$line[1]" in
            '1')
                x="${line:2:1}"
                y="${line:3:1}"
                fnum=$((++n))
                fname="$(echo $line | cut -d' ' --complement -f1-8)"
                printf '\033[0;32m%s\033[0m\033[0;31m%s\033[0m \033[0;35m[%s]\033[0m %s\n' "$x" "$y" "$fnum" "$fname"
                ;;
            '2')
                x="${line:2:1}"
                y="${line:3:1}"
                fnum=$((++n))
                fnum2=$((++n))
                fname="$(echo $line | cut -d' ' --complement -f1-9)"
                echo "$fname" | IFS=$'\t' read fname2 fname
                printf '\033[0;32m%s\033[0m\033[0;31m%s\033[0m \033[0;35m[%s]\033[0m %s → \033[0;35m[%s]\033[0m %s\n' "$x" "$y" "$fnum" "$fname" "$fnum2" "$fname2"
                ;;
            'u')
                x="${line:2:1}"
                y="${line:3:1}"
                fnum=$((++n))
                fname="$(echo $line | cut -d' ' --complement -f1-10)"
                printf '\033[1;31m%s%s\033[0m \033[0;35m[%s]\033[0m \033[0;31m%s\033[0m\n' "$x" "$y" "$fnum" "$fname"
                ;;
            '?')
                fnum=$((++n))
                fname="${line:2}"
                printf '\033[0;31m??\033[0m \033[0;35m[%s]\033[0m \033[0;33m%s\033[0m\n' "$fnum" "$fname"
                ;;
            '!')
                fnum=$((++n))
                fname="${line:2}"
                printf '\033[0;34m!!\033[0m \033[0;35m[%s]\033[0m \033[0;34m%s\033[0m\n' "$fnum" "$fname"
                ;;
        esac

        eval "$prefix""$fnum"="\"$(realpath -m "$fname")\""
        [[ -n "$fname2" ]] && {
            eval "$prefix""$fnum2"="\"$(realpath -m "$fname2")\""
        }

    done
}

# cd parent folder using fzf menu
# dependencies: fzf, fzf's key-bindings.zsh
cb() {
    local segments=("${(s:/:)$(pwd)}")
    local length=${#segments[@]}
    local count=$((count-1))
    local list=("${segments[@]:1:$count}")
    setopt pipefail
    index=$(local IFS=$'\n'; echo "${list[*]}" | awk -v OFS=/ '{print NR, $0}' |\
        fzf --tac -0 -1 --with-nth 2 -d / | awk -F / '{print $1}')
    set +o pipefail
    [[ -z $index ]] && {
        zle redisplay
        return 0
    }
    local IFS=$'/'
    local result="/${list[@]:0:$index}"
    echo $result
    zle push-line
    BUFFER="cd ${(q)result}"
    zle accept-line
    local ret=$?
    unset IFS
    unset result
    zle reset-prompt
    return $ret
}

zle -N cb

# Dynamic terminal title
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
    print -Pn -- '\e]2;%~\a'
    [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
    print -Pn -- '\e]2;%~%# ' && print -n -- "${(q)1}\a"
    [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
    add-zsh-hook -Uz precmd xterm_title_precmd
    add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Exit on partial command line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

# test bootable USB flash drive
usboot() {
	qemu-system-x86_64 -m 2048 -smp 2 -enable-kvm -bios /usr/share/edk2-ovmf/x64/OVMF_CODE.fd -usb -device usb-host,hostbus="$1",hostaddr="$2"
}

# boot ISO in QEMU
isoboot() {
	qemu-system-x86_64 -m 2048 -smp 2 -enable-kvm -bios /usr/share/edk2-ovmf/x64/OVMF_CODE.fd -boot d -cdrom "$1"
}

# load functions from functions.d dir
if [ $(find "$ZDOTDIR/functions.d" -type f | wc -l) -gt 0 ]; then
    for f in "$ZDOTDIR/functions.d"/*.zsh
    do
        source "$f"
    done
fi
