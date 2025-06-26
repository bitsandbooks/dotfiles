#!/usr/bin/env sh

# Get computer name
box_name() { hostname -s }

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

# Escape UTF-8 characters into their 3-byte format
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    echo # newline
}

# collapse dir if in
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the
# Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
    encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Gzip-enabled `curl`
function gurl() { curl -sH "Accept-Encoding: gzip" "$@" | gunzip }

# Reusable SSH Agent
function start_ssh_agent() {
  local agent_info_file="$HOME/.ssh/agent.env"

  # Reuse existing agent if possible
  if [[ -f "$agent_info_file" ]]; then
    source "$agent_info_file" > /dev/null

    if [[ -n "$SSH_AGENT_PID" ]] && ps -p $SSH_AGENT_PID > /dev/null 2>&1; then
      return 0
    fi

    # Clean up stale environment file
    rm -f "$agent_info_file"
    unset SSH_AGENT_PID SSH_AUTH_SOCK
  fi

  # Start new ssh-agent and save its environment
  eval "$(ssh-agent -s -E sha256)" > /dev/null
  echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > "$agent_info_file"
  echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >> "$agent_info_file"
  chmod 600 "$agent_info_file"
}


