# River
This is a simple river configuration that will be constantly changing, I try to stick with gtk apps
mostly because QT consistency SUCKS.
Theming is not done yet and most of the config is barebones.

## Sofware
##### Important
- Compositor: river
- Bar: waybar (want to migrate to AGS)
- Launcher: rofi-wayland
- Notification daemon: swaync
- Wallpaper: SWWW
- Idle Daemon: swayidle
- Lock Screen: swaylock-effects
- Clipboard Manager: cliphist + wl-clipboard
- Wifi: networkmanager + nm-applet
- Audio: Pipewire + Pamixer
##### Apps
- Shell: zsh
- Terminal: kitty
- File manager: yazi + nautilus
- Editor: neovim
- Browser: firefox
- Image Viewer: loupe

## Installation
#### Important Stuffs

```
sudo pacman -S xdg-desktop-portal-wlr brightnessctl playerctl polkit-gnome zsh zsh-completions
```

#### Window manager stuffs

```
sudo pacman -S --needed river waybar swaync swayidle rofi-wayland kitty swww network-manager-applet
```

#### Utilities

```
sudo pacmna -S cliphist wl-clipboard neovim firefox loupe tmux bat btop yazi jq p7zip ffmpegthumbnailer fd ripgrep fzf poppler zoxide imagemagick chafa
```

#### Pipewire

```
sudo pacman -S pipewire wireplumber pamixer pipewire-pulse pipewire-jack pipewire-alsa
```

#### AUR stuffs

```
yay -S swaylock-effects
```

## Theming

```
yay -S bibata-cursor-theme-bin
```
