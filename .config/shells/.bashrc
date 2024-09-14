#
# ~/.bashrc
#

export ELECTRON_OZONE_PLATFORM_HINT=wayland 

# bash-completions things
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Yazi Wrapper (To move directory when exiting)
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# source aliases
source "$dotconf/shells/.global_aliases"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Starship prompt
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

# Important, never remove
fastfetch

