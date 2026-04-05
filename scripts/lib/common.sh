#!/usr/bin/env bash
set -euo pipefail

SCRIPT_LIB_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_LIB_DIR/../.." && pwd)"

log() {
  printf '[debian-setup] %s\n' "$*"
}

require_file() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    printf 'Required file not found: %s\n' "$path" >&2
    exit 1
  fi
}

apt_install_from_file() {
  local package_file="$1"
  require_file "$package_file"

  mapfile -t packages < <(grep -vE '^[[:space:]]*(#|$)' "$package_file")
  if [[ ${#packages[@]} -eq 0 ]]; then
    printf 'No installable packages found in %s\n' "$package_file" >&2
    exit 1
  fi

  sudo apt update
  sudo apt install -y "${packages[@]}"
}
