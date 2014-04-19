# Reload .zshrc
#alias reload!='. ~/.zshrc'

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
#alias --='cd -'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls='command ls -GH'
else
	alias ls='ls -H --color=auto'
fi

# Other simple aliases
alias ll='ls -lah'
alias lsd='ls -lah | grep "^d"' # List only directories
alias cls=clear
alias hist='fc -l 1'
alias more=less
alias moar=less # for the lulz
alias sl=ls # I still do this ALL the time

# Aliases related to apps
alias curl='curl --progress-bar'
alias markdown='/usr/local/bin/markdown'
alias wget='wget --progress=bar'

