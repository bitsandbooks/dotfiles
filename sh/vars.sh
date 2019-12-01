#!/bin/sh

export EDITOR=vim
export LESS="--ignore-case --quit-if-one-screen --silent --squeeze-blank-lines --tabs=4"
export PATH="/usr/local/bin:/opt/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$HOME/.local/bin:."
export PROJECTS="$HOME/projects"
export VISUAL="$EDITOR"
export VIM="$HOME/.dotfiles/vim"

# bash(?) history file
export HISTSIZE=1000 # Size of history (default = 500)
export HISTFILESIZE=10000
export HISTCONTROL="erasedups" # Ignore duplicates
export HISTIGNORE="ll:ls:ls *:cd:cd -:pwd:pick:exit:date:* --help" # Commands to ignore
