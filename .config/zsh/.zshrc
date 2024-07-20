# --------------------
# Load personal stuffs
# --------------------
# The most important part here
fastfetch

# just boring stuffs
if [ -d ~/.dotfiles ]; then
    for rc in $dotfiles/personal/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
# --------------------------------------
# Lines configured by zsh-newuser-install
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000
# --------------
# Autocompletion
# --------------
zstyle :compinstall filename '"$ZDOTDIR"/.zshrc'
setopt auto_pushd
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Completion files: Use XDG dirs
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# ----------------
# Spaceship prompt
# ----------------
SPACESHIP_PROMPT_ADD_NEWLINE=false
source /usr/lib/spaceship-prompt/spaceship.zsh
