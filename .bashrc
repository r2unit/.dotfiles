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

# hyprsync completions
[ -f "/home/r2unit/.local/share/bash-completion/completions/hyprsync" ] && source "/home/r2unit/.local/share/bash-completion/completions/hyprsync"
