#
# ~/.bashrc
#

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc

fi

export ELECTRON_OZONE_PLATFORM_HINT=wayland 
# Setting dotfiles & reading 
if [ -d ~/.dotfiles ]; then
    export dotfiles="$HOME"/.dotfiles
    export dotconf="$dotfiles"/.config
    export ZDOTDIR="$dotfiles"/.config/zsh/

    for rc in "$dotfiles"/personal/*; do
        if [ -f "$rc" ]; then
    	. "$rc"
        fi
    done

    unset rc
fi


PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Important, never remove
fastfetch
