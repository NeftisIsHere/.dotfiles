# --------------------
# Load personal stuffs
# --------------------

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
# Global aliases
# ----------------
source "$dotconf/shells/.global_aliases"

# ------------
# Yazi wrapper
# ------------
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# ----------------
# Starship prompt
# ----------------
eval "$(starship init zsh)"

# ----------------------------
# The most important part here
# ----------------------------
fastfetch
