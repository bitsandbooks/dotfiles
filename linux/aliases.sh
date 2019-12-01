#!/usr/bin/env sh

alias aptup="apt-get update && apt-get -y upgrade && apt-get -y autoremove"
alias ls='ls --color=auto --human-readable --dereference-command-line'

# this command will pull the latest versions of all
# current docker images (if docker is installed).
# see https://git.io/vxRv3
# as to the weird quote marks... it's complicated.
# see http://bit.ly/2DR4dOv
alias dockerup='docker images | grep -v REPOSITORY | awk '"'"'{print $1}'"'"' | uniq -u | xargs -L1 docker pull'
