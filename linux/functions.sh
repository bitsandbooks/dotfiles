#!/usr/bin/env sh

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
  if command -v ssh-add >/dev/null 2>&1; then
    # List of default keys to add (edit or expand as needed)
    local ssh_keys=(
        "test_key_rsa"
        "test_key_ed25519"
    )

    for key in "${ssh_keys[@]}"; do
      if [[ -f "$HOME/.ssh/$key" ]]; then
        ssh-add "$HOME/.ssh/$key" >/dev/null 2>&1
      fi
    done
  fi
}
