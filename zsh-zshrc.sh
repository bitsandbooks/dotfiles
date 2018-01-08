#!/bin/zsh

# There are five startup files that zsh will read commands from:
# 
# $ZDOTDIR/.zshenv
# $ZDOTDIR/.zprofile
# $ZDOTDIR/.zshrc
# $ZDOTDIR/.zlogin
# $ZDOTDIR/.zlogout
# 
# If ZDOTDIR is not set, then the value of HOME is used; this is the usual case.
# 
# '.zshenv' is sourced on all invocations of the shell, unless the -f option is 
# set. It should contain commands to set the command search path, plus other 
# important environment variables. '.zshenv' should not contain commands that 
# produce output or assume the shell is attached to a tty.
# 
# '.zshrc' is sourced in interactive shells. It should contain commands to set 
# up aliases, functions, options, key bindings, etc.
# 
# '.zlogin' is sourced in login shells. It should contain commands that should 
# be executed only in login shells. '.zlogout' is sourced when login shells 
# exit. '.zprofile' is similar to '.zlogin', except that it is sourced before 
# '.zshrc'. '.zprofile' is meant as an alternative to '.zlogin' for ksh fans; 
# the two are not intended to be used together, although this could certainly 
# be done if desired. '.zlogin' is not the place for alias definitions, 
# options, environment variable settings, etc.; as a general rule, it should 
# not change the shell environment at all. Rather, it should be used to set the 
# terminal type and run a series of external commands (fortune, msgs, etc).
# 
# Source: http://zsh.sourceforge.net/Intro/intro_3.html

# set $OS variable
if [ `uname` = "Darwin" ]; then
  export OS='macos'
elif [ `uname` = "Linux" ]; then
  export OS='linux'
else
  export OS='unknown'
fi

### ALIASES

# import platform- and shell-agnostic aliases, then set zsh-specific aliases
source "$HOME/.dotfiles/$OS-aliases.sh"
source "$HOME/.dotfiles/sh-aliases.sh"
alias reloadzsh="source $HOME/.zshrc"

### FUNCTIONS

# collapse dir if in
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# Get computer name
box_name() { hostname -s }

# Create a new directory and enter it
md() { mkdir -p "$@" && cd "$@" }

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the
# Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
    encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Gzip-enabled `curl`
function gurl() { curl -sH "Accept-Encoding: gzip" "$@" | gunzip }

# Escape UTF-8 characters into their 3-byte format
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
    echo # newline
}

# Get a character’s Unicode code point
function codepoint() {
    perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
    echo # newline
}

### OPTIONS

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a $HOME/.localrc ]]; then
    source $HOME/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# Colors for ls
zstyle ':completion:*' list-colors ''

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# load colors
autoload colors && colors

# Zsh options
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

### KEYBINDINGS

# enable history search using ^R
bindkey '^R' history-incremental-search-backward
