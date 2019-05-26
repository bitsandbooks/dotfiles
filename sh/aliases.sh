#!/bin/sh

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'

# Other simple aliases
alias cls=clear
alias hist='fc -l 1'
alias ll='ls -lah'
alias lll='ls -lah | less'
alias lsd='ls -lah | grep "^d"' # List only directories
alias lld=lsd
alias moar='less -X' # for the lulz
alias sl=ls # I still do this ALL the time
alias path="echo $PATH | tr ':' '\n'"

# Aliases related to apps
alias curl='curl --progress-bar'
alias wget='wget --progress=bar'
alias django='python3 ./manage.py'
alias py2=python2
alias py3=python3
alias alint=ansible-lint
alias aplay=ansible-playbook
