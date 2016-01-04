# Reload .bashrc
#alias reload!='. ~/.bashrc'

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
alias lll='ls -lah | less -r'
alias lsd='ls -lah | grep "^d"' # List only directories
alias lld=lsd
alias cls=clear
alias hist='fc -l 1'
alias more=less
alias moar=less # for the lulz
alias sl=ls # I still do this ALL the time
alias showpath="echo $PATH | tr ':' '\n'"

# Aliases related to apps
alias curl='curl --progress-bar'
alias markdown='/usr/local/bin/markdown'
alias mdown=markdown
alias wget='wget --progress=bar'

