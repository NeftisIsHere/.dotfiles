#!/usr/bin/env bash

killall waybar
# ------------------------------------------------------------------- 
# Load the configuration
# ------------------------------------------------------------------- 
waybar -c $HOME/.dotfiles/.config/waybar/config -s $HOME/.dotfiles/.config/waybar/style.css

