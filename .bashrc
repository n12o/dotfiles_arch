#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config_add='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add'
alias config='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias fzpac="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pkglist_gen="pacman -Qqen > pkglist.txt"
alias pkglist_gen_aur="pacman -Qqem > pkglist_aur.txt"
