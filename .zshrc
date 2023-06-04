if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

if [ -z "$IN_NIX_SHELL" ]; then
    export PROMPT='%F{blue}%1~ %f$ '
else
    export PROMPT='%F{red}%1~ %f$ '
fi

alias nixdev="nix develop -c zsh"

# Fix various chrome OS SSH client issues
bindkey "^[[1;5C" forward-word # These are for ctrl+right-arrow etc
bindkey "^[[1;5D" backward-word
export LANG="en_US.UTF-8"
