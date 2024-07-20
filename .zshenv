if [ -d ~/.dotfiles ]; then
    export dotfiles="$HOME/.dotfiles"
    export dotconf="$dotfiles"/.config
    export ZDOTDIR="$dotfiles/.config/zsh/"
else
    export XDG_CONFIG_HOME="$HOME/.config"
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
