#!/usr/bin/env bash
# pacman -Syuu --noconfirm

# pacman -S --needed --noconfirm - < packages-pacman.txt

# yay installation
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S --noconfirm - < packages-yay.txt

