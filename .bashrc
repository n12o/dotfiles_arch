#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias config_git='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias fzpac="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pkglist_gen="pacman -Qqen > pkglist.txt && pacman -Qqem > pkglist_aur.txt"
alias lock="dm-tool lock"
