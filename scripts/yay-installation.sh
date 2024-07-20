#!/bin/bash 

sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
#makepkg -si
echo "YAY INSTALLED"
cd ..
rm -rf yay

# Running initial setup
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save