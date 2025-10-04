#!/bin/sh
# Install system and AUR packages from saved lists

set -e  # exit on error

echo "Checking for paru..."
if ! command -v paru >/dev/null 2>&1; then
    echo "paru not found, installing..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    (cd /tmp/paru && makepkg -si --noconfirm)
    rm -rf /tmp/paru
else
    echo "paru already installed"
fi

echo "Installing repo packages from pkglist.txt..."
sudo pacman -S --needed --noconfirm - < "$HOME/.dotfiles/packages/pkglist.txt"

echo "Installing AUR packages from foreignpkglist.txt..."
paru -S --needed --noconfirm - < "$HOME/.dotfiles/packages/foreignpkglist.txt"

echo "All packages installed successfully."

