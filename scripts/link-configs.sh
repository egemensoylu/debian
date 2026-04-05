#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

backup_and_link() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname -- "$target_path")"

  if [[ -L "$target_path" ]] && [[ "$(readlink -- "$target_path")" == "$source_path" ]]; then
    echo "Already linked: $target_path"
    return 0
  fi

  if [[ -e "$target_path" || -L "$target_path" ]]; then
    mv "$target_path" "${target_path}.bak.$(date +%Y%m%d%H%M%S)"
  fi

  ln -s "$source_path" "$target_path"
  echo "Linked $target_path -> $source_path"
}

backup_and_link "$REPO_ROOT/config/bash/aliases.sh" "$HOME/.bash_aliases"
backup_and_link "$REPO_ROOT/config/tmux/tmux.conf" "$HOME/.tmux.conf"
backup_and_link "$REPO_ROOT/config/vim/vimrc" "$HOME/.vimrc"
backup_and_link "$REPO_ROOT/config/git/gitconfig.example" "$HOME/.gitconfig.bootstrap"

mkdir -p "$HOME/.config/awesome"
backup_and_link "$REPO_ROOT/config/awesome/rc.lua" "$HOME/.config/awesome/rc.lua"
backup_and_link "$REPO_ROOT/config/awesome/keys.lua" "$HOME/.config/awesome/keys.lua"
backup_and_link "$REPO_ROOT/config/awesome/rules.lua" "$HOME/.config/awesome/rules.lua"
backup_and_link "$REPO_ROOT/config/awesome/signals.lua" "$HOME/.config/awesome/signals.lua"
backup_and_link "$REPO_ROOT/config/awesome/autostart.sh" "$HOME/.config/awesome/autostart.sh"
backup_and_link "$REPO_ROOT/config/awesome/widgets" "$HOME/.config/awesome/widgets"
backup_and_link "$REPO_ROOT/config/awesome/themes" "$HOME/.config/awesome/themes"

if [[ ! -f "$HOME/.config/awesome/local.lua" ]]; then
  cp "$REPO_ROOT/config/awesome/local.lua.example" "$HOME/.config/awesome/local.lua"
  printf '\nCreated ~/.config/awesome/local.lua from the example file.\n'
fi

printf '\nAdded ~/.gitconfig.bootstrap. Merge what you want into ~/.gitconfig or include it manually.\n'
printf 'AwesomeWM config files are linked into ~/.config/awesome. Machine-specific changes belong in ~/.config/awesome/local.lua.\n'
