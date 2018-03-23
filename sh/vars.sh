#!/bin/sh

export PROJECTS="$HOME/projects"
export EDITOR="vim"
export VISUAL="$EDITOR"
export VIM="$HOME/.dotfiles/vim"
export PATH="$HOME/bin:/usr/local/bin:/opt/bin:/usr/bin:/bin:/usr/sbin:/sbin:."

# history file
export HISTSIZE=1000 # Size of history (default = 500)
export HISTFILESIZE=10000
export HISTCONTROL="erasedups" # Ignore duplicates
export HISTIGNORE="ll:ls:ls *:cd:cd -:pwd:exit:date:* --help" # Commands to ignore

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
