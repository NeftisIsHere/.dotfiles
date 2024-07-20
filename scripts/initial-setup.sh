#!/bin/bash

# Install yay
./yay-installation.sh


# I know this sucks, everyone knows, i dont care, move on.

cd "$PWD"/.. 
ln -s "${PWD}"/.bashrc "$HOME"

# shellcheck disable=SC1091
source .bashrc



DOTS_CONFIG="$dotfiles"/.config
# Symbolic links
for folder in "$DOTS_CONFIG"/*; do
    ln -s "$folder" "XDG_CONFIG_HOME"
done 
# ln -s "$DOTS_CONFIG"/alacritty "$XDG_CONFIG_HOME"
# ln -s "$DOTS_CONFIG"/fastfetch "$XDG_CONFIG_HOME"
# ln -s "$DOTS_CONFIG"/hypr "$XDG_CONFIG_HOME"
# ln -s "$DOTS_CONFIG"/kitty "$XDG_CONFIG_HOME"
# ln -s "$DOTS_CONFIG"/tmux "$XDG_CONFIG_HOME"

#echo "PS1='[\u@\h \W]\$ '" >> .bashrc