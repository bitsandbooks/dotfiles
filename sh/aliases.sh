#!/bin/sh

# Other simple aliases
alias cls=clear
alias hist='fc -l 1'
alias ll="ls -Ahl --color=auto"
alias lll='ll | less'
alias lld='ll | grep "^d"' # List only directories
alias sl=ls # I still do this ALL the time
alias path="echo \$PATH | tr ':' '\n'"

# Aliases related to apps
alias curl='curl --progress-bar'
alias wget='wget --progress=bar'
alias django='python3 ./manage.py'
alias py2=python2
alias pip=pip3 # it's time
