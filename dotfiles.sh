#!/usr/bin/env bash
# Use this script to link and unlink any files in this repo with names ending in
# '.symlink' into your home folder.
# Copyright © 2025 by Rob Dumas
# License: BSD-3-Clause

set -euo pipefail
IFS=$'\n\t'

print_help() {
  cat << EOF
Usage: $(basename "$0") ACTION

Actions:
  link     Find all *.symlink files under the current directory and create symlinks in \$HOME.
           Existing files in \$HOME with the same name will be moved to .backup before linking.
  unlink   Remove those symlinks from \$HOME and restore any .backup files.
  help     Show this message and exit.
EOF
}

do_link() {
  find . -type f -name '*.symlink' -print0 | while IFS= read -r -d '' src; do
    name="$(basename "$src" .symlink)"
    target="$HOME/.$name"
    abs_src="$(realpath "$src")"

    # Backup existing file or symlink
    if [ -e "$target" ] || [ -L "$target" ]; then
      mv -v "$target" "$target.backup"
    fi

    # Create symlink
    ln -s "$abs_src" "$target"
    echo "Linked: $target → $abs_src"
  done
}

do_unlink() {
  find . -type f -name '*.symlink' -print0 | while IFS= read -r -d '' src; do
    name="$(basename "$src" .symlink)"
    target="$HOME/$name"

    # Remove symlink if present
    if [ -L "$target" ]; then
      rm -v "$target"
      echo "Removed symlink: $target"
    fi

    # Restore backup if present
    if [ -e "$target.backup" ]; then
      mv -v "$target.backup" "$target"
      echo "Restored backup: $target"
    fi
  done
}

main() {
  if [ $# -ne 1 ]; then
    echo "Error: Missing action." >&2
    print_help
    exit 1
  fi

  case "$1" in
    link)
      do_link
      ;;
    unlink)
      do_unlink
      ;;
    help|-h|--help)
      print_help
      ;;
    *)
      echo "Error: Unknown action '$1'." >&2
      print_help
      exit 1
      ;;
  esac
}

main "$@"
