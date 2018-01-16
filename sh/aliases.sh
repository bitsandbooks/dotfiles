#!/bin/sh

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'

# Other simple aliases
alias cls=clear
alias hist='fc -l 1'
alias less='less -X' # don't clear screen when less exits
alias ll='ls -lah'
alias lll='ls -lah | less -r'
alias lsd='ls -lah | grep "^d"' # List only directories
alias lld=lsd
alias moar='less -X' # for the lulz
alias sl=ls # I still do this ALL the time
alias path="echo $PATH | tr ':' '\n'"

# Aliases related to apps
alias curl='curl --progress-bar'
alias wget='wget --progress=bar'
