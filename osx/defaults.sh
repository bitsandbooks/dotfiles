#!/bin/sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# test -e "$(brew --prefix)/etc/bash_completion" && source "$(brew --prefix)/etc/bash_completion"