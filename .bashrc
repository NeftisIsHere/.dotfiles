#
# ~/.bashrc
#
if [ -d ~/.dotfiles ]; then
    export DOTFILES="$HOME/.dotfiles"
    export ZDOTDIR="$DOTFILES/.config/zsh/"
else
    export XDG_CONFIG_HOME="$HOME/.config"
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -d ~/.dotfiles ]; then
    export DOTFILES="$HOME/.dotfiles"
    for rc in $DOTFILES/personal/*; do
        if [ -f "$rc" ]; then
	    . "$rc"
	fi
    done
fi

PS1='[\u@\h \W]\$ '

# Important, never remove
fastfetch
