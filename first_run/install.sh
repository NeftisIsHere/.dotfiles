#!/bin/sh
# Automated system setup for my files

set -e  # exit on error

cd "$HOME/.dotfiles/scripts"

echo "Updating system"
sudo pacman -Syu --noconfirm

echo "Checking for Chaotic-AUR..."
if ! pacman -Sl chaotic-aur >/dev/null 2>&1; then
    echo "Chaotic-AUR repo not found!"
    echo "Please install it manually before continuing:"
    echo "https://aur.chaotic.cx/"
    exit 1
fi

echo "Installing packages"
"$HOME/.dotfiles/scripts/packages.sh"

echo "Linking configuration files"
"$HOME/.dotfiles/scripts/link-configs.sh"

echo "Configuring NetworkManager with iwd"
"$HOME/.dotfiles/scripts/network.sh"

echo "Linking shell configs"
"$HOME/.dotfiles/scripts/link-shells.sh"

echo "Enabling swaync and waybar under niri.service"
systemctl --user add-wants niri.service swaync.service
systemctl --user add-wants niri.service waybar.service

echo "Enabling SDDM"
systemctl enable sddm.service

echo "Setup complete"

read -rp "Reboot now? [y/N]: " answer
case "$answer" in
    [Yy]* ) sudo reboot ;;
    * ) echo "Reboot skipped. You should reboot manually to start sddm." ;;
esac
