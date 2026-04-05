#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

apt_install_from_file "$REPO_ROOT/packages/awesome.txt"

printf '\nAwesomeWM package group installed.\n'
printf 'If this is a minimal machine, ensure you also have an X session/display manager available.\n'
