#!/bin/bash

killall waybar

# ------------------------------------------------------------------- 
# Load the configuration
# ------------------------------------------------------------------- 
waybar -c $DOTFILES/.config/waybar/config -s $DOTFILES/.config/waybar/style.css
