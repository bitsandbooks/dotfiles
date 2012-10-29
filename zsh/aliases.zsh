# Reload .zshrc
#alias reload!='. ~/.zshrc'

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
#alias --='cd -'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls='command ls -G'
else
	alias ls='command ls --color'
fi

# Other simple aliases
alias ll='ls -lah'
alias lsd='ls -l | grep "^d"' # List only directories
alias cls=clear
alias hist='fc -l 1'
alias more=less
alias moar=less # for the lulz
alias o=open
alias oo='open .'
alias sl=ls # I still do this ALL the time

# Aliases related to apps
alias curl='curl --progress-bar'
alias ffx='open -a Firefox'
alias firefox='open -a Firefox'
alias gem='$HOME/bin/gem'
alias git='/usr/local/bin/git'
alias mate='open -a TextMate'
alias markdown='/usr/local/bin/markdown'
alias python='/usr/local/bin/python'
alias ruby='$HOME/.rvm/bin/ruby'
alias tc='open -a TrueCrypt'
alias wget='/usr/local/bin/wget --progress=bar'