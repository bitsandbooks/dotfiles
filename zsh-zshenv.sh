#!/bin/zsh

# '.zshenv' is sourced on all invocations of the shell, unless the -f option is 
# set. It should contain commands to set the command search path, plus other 
# important environment variables. '.zshenv' should not contain commands that 
# produce output or assume the shell is attached to a tty.

# import shell-agnostic vars
source $HOME/.dotfiles/sh-vars.sh

# shell-specific vars
export HISTFILE=$HOME/.zsh_history # History file location

# Set the prompt.
precmd() { echo "\n" }
export PROMPT='%{$fg[magenta]%}%n@%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}
%# '
