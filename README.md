# Dotfiles — Arch Linux (Wayland)

Personal setup for my Arch environment.  
Everything lives in $HOME/.dotfiles for easy restore and linking.  
This repo is for me, not a template.

## Setup (for me)

1. git clone https://github.com/NeftisIsHere/.dotfiles ~/.dotfiles
2. cd ~/.dotfiles
3. ./first_run/install.sh
4. If needed: ./first_run/link-configs.sh
5. If needed: ./first_run/link-shells.sh
6. ~/.dotfiles/bin/wal-refresh.sh — rebuilds colors for Niri, Hyprlock, Waybar, Yazi, etc.

## My stack:

Niri: main compositor
Hyprland: alt compositor
Waybar: shared bar config
SwayNC: notification daemon  
Wlogout: logout/lock menu  
Hyprlock + Hypridle: lock and idle daemons  
Waypaper: wallpaper + Pywal integration

## Shells & CLI

Shared stuff in .config/shells/shared  
Starship prompt for both bash and zsh  
.profile exports only core vars and XDG paths

## Extras

MPD + RMPC setup  
Yazi as terminal explorer
Wallpapers stored under [insert git repo here/]

