#!/bin/sh

export EDITOR="vim"
export LESS="--ignore-case --quit-if-one-screen --silent --squeeze-blank-lines --tabs=4"
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/opt/make/libexec/gnubin:/usr/local/bin:/opt/bin:/usr/bin:/bin:/usr/sbin:/sbin:."
export PROJECTS="$HOME/projects"
export VISUAL="$EDITOR"
export VIM="$HOME/.dotfiles/vim"

# history file
export HISTSIZE=1000 # Size of history (default = 500)
export HISTFILESIZE=10000
export HISTCONTROL="erasedups" # Ignore duplicates
export HISTIGNORE="ll:ls:ls *:cd:cd -:pwd:exit:date:* --help" # Commands to ignore
