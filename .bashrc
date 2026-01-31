#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

vpn() {
    case "$1" in
        quanza)
            case "$2" in
                up) sudo swanctl --initiate --child qdips-child ;;
                down) sudo swanctl --terminate --ike qdips-vpn ;;
                *) echo "usage: vpn quanza [up|down]" ;;
            esac
            ;;
        status) sudo swanctl --list-sas ;;
        *) echo "usage: vpn [quanza up|quanza down|status]" ;;
    esac
}
