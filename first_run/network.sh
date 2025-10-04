#!/bin/sh
# Configure NetworkManager to use iwd as Wi-Fi backend

set -e  # exit on error

echo "Installing required packages"
sudo pacman -S --needed --noconfirm networkmanager iwd

echo "Configuring NetworkManager to use iwd"
sudo mkdir -p /etc/NetworkManager/conf.d
echo "[device]
wifi.backend=iwd" | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf >/dev/null

echo "Enabling and starting services"
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now iwd

echo "NetworkManager with iwd backend is set up"

