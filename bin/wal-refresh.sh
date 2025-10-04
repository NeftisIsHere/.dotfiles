#!/bin/bash
# Minimal Waypaper → Pywal hook

WALLPAPER="$1"

# Apply pywal colors
wal -q -i "$WALLPAPER" --backend colorz
# wal -q -i "$WALLPAPER" --backend wal
cp $XDG_CACHE_HOME/wal/niri/niri-colors $dotconf/niri/colors.kdl

systemctl --user restart swaync || { 
  pkill swaync && while pgrep swaync >/dev/null; do sleep 0.1; done && swaync & 
}


walcord

# Log for debugging
echo "[wal-refresh] $WALLPAPER" >> ~/.cache/wal-refresh.log

