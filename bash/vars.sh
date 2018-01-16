#!/bin/bash

# import shell-agnostic vars
source $HOME/.dotfiles/sh-exports.sh

# shell-specific vars
export HISTFILE=$HOME/.bash_history # History file location

# Set the prompt.
export PS1="\n\[\033[38;5;9m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$\[$(tput sgr0)\] "
