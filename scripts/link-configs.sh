#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

link_file() {
  local source_file="$1"
  local target_file="$2"

  mkdir -p "$(dirname "$target_file")"

  if [[ -e "$target_file" || -L "$target_file" ]]; then
    mv "$target_file" "${target_file}.bak.$(date +%Y%m%d%H%M%S)"
  fi

  ln -s "$source_file" "$target_file"
  echo "Linked $target_file -> $source_file"
}

link_file "$REPO_ROOT/config/bash/aliases.sh" "$HOME/.bash_aliases"
link_file "$REPO_ROOT/config/tmux/tmux.conf" "$HOME/.tmux.conf"
link_file "$REPO_ROOT/config/vim/vimrc" "$HOME/.vimrc"
