#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# My aliases
# arch package manager
alias update="sudo pacman -Syu"
alias install="sudo pacman -Syu"
alias searchfor="pacman -Ss"

# prefer vim over vi
alias vi='vim'
