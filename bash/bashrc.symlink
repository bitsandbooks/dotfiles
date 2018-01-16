#!/bin/bash

# set $OS variable
if [ `uname` = "Darwin" ]; then
  export OS='macos'
elif [ `uname` = "Linux" ]; then
  export OS='linux'
else
  export OS='unknown'
fi

### ALIASES

# import platform- and shell-neutral aliases, then set bash-specific aliases
source "$HOME/.dotfiles/$OS-aliases.sh"
source "$HOME/.dotfiles/sh-aliases.sh"
alias reloadbash="source $HOME/.bashrc"

# import platform- and shell-neutral environment variables
source $HOME/.dotfiles/$OS-vars.sh
source $HOME/.dotfiles/bash-vars.sh

### FUNCTIONS

# Get computer name
box_name() { [ -f $HOME/.box-name ] && cat $HOME/.box-name || hostname -s }

# Create a new directory and enter it
md() { mkdir -p "$@" && cd "$@" }

# Gzip-enabled `curl`
function gurl() { curl -sH "Accept-Encoding: gzip" "$@" | gunzip }

### OPTIONS

# complete command names and file names
complete -cf sudo

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a $HOME/.localrc ]]; then
  source $HOME/.localrc
fi

### KEYBINDINGS
