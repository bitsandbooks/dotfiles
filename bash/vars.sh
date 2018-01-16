#!/usr/bin/env bash

# shell-specific vars
export HISTFILE="$HOME/.bash_history" # History file location

# Set the prompt.
export PS1="\[\033[38;5;5m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$\[$(tput sgr0)\]"
