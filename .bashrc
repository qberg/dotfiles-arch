#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Better cd
#cl() { cd "$1" && ls }
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

[ -f "/home/qberg/.ghcup/env" ] && source "/home/qberg/.ghcup/env" # ghcup-env

# Granularise bashrc
source /home/qberg/.shell/aliases
source /home/qberg/.shell/functions

export PATH="$PATH:/usr/local/go/bin:/usr/bin/elixir"
. "$HOME/.cargo/env"
