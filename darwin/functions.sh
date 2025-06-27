#!/usr/bin/env sh

# Load GPG agent
function gpg_cache () {
    gpg-connect-agent /bye &> /dev/null # 1
    eval $(op signin) # 2
    op item get $OP_GPG_PASSPHRASE --fields password | /usr/local/MacGPG2/libexec/gpg-preset-passphrase --preset $GPG_KEY_FOR_OP_TO_UNLOCK # 3
}
# gpg_cache # 4

function brewup () {
    brew bundle --file $DOTFILES/darwin/Brewfile
    brew update
    brew upgrade --greedy
    brew cleanup
}

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

function load_ssh_keys() {
  # Add keys to Keychain
  if command -v ssh-add >/dev/null 2>&1; then
    # List of default keys to add (edit or expand as needed)
    local ssh_keys=(
        "test_key_rsa"
        "test_key_ed25519"
        "torgo-router-rsa"
        "torgo-2025-ssh-ed25519"
        "github-rob-uranium-2025-06-20.sshkey"
    )

    for key in "${ssh_keys[@]}"; do
      if [[ -f "$HOME/.ssh/$key" ]]; then
        ssh-add -K "$HOME/.ssh/$key" >/dev/null 2>&1
      fi
    done
  fi
}