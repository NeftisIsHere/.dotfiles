#!/bin/sh
# Link shell config files from dotfiles to $HOME

set -e

DOTFILES="$HOME/.dotfiles/.config/shells"

echo "Linking Bash configs..."
ln -sf "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"
ln -sf "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"

echo "Linking shared profile..."
ln -sf "$DOTFILES/shared/.profile" "$HOME/.profile"

echo "Linking Zsh configs..."
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"

echo "Shell configs linked successfully."

