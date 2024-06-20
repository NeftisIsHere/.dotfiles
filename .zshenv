if [ -d ~/.dotfiles ]; then
    export DOTFILES="$HOME/.dotfiles"
    export ZDOTDIR="$DOTFILES/.config/zsh/"
else
    export XDG_CONFIG_HOME="$HOME/.config"
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
