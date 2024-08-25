#!/bin/bash

killall waybar

# ------------------------------------------------------------------- 
# Load the configuration
# ------------------------------------------------------------------- 
waybar -c "$dotconf"/waybar/config -s "$dotconf"/waybar/style.css

