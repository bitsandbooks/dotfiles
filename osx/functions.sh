#!/bin/sh

# import RVM as a function
if [[ -d ${HOME}/.rvm ]]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi

# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)
