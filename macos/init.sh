#!/usr/bin/env sh

source $DOTFILES/macos/aliases.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# This only needs to be run once; otherwise, it slows down terminal windows
# source $DOTFILES/macos/setdefaults.sh 
