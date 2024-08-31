#!/usr/bin/env bash

killall waybar
export dotconf="/home/jazz/.dotfiles/.config"
# ------------------------------------------------------------------- 
# Load the configuration
# ------------------------------------------------------------------- 
waybar -c "$dotconf"/waybar/config -s "$dotconf"/waybar/style.css

