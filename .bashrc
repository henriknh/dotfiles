#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$(yarn global bin):$PATH"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

