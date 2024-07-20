#!/bin/bash

killall waybar

# ------------------------------------------------------------------- 
# Load the configuration
# ------------------------------------------------------------------- 
waybar -c "$dotfiles"/.config/waybar/config -s "$dotfiles"/.config/waybar/style.css

