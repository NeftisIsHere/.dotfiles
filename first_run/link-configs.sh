#!/bin/sh
# Symlink everything to $XDG_CONFIG_HOME

DOTFILES="$HOME/.dotfiles/.config"
TARGET="$HOME/.config"

# Make sure target exists
mkdir -p "$TARGET"

# Symlink everything (files and dirs) into ~/.config
for item in "$DOTFILES"/*; do
    ln -snf "$item" "$TARGET/"
    echo "Linked $(basename "$item") -> $TARGET/$(basename "$item")"
done

