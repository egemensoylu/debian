#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

run_step() {
  local description="$1"
  local script_name="$2"

  read -r -p "$description [y/N]: " answer
  case "$answer" in
    y|Y|yes|YES)
      "$SCRIPT_DIR/$script_name"
      ;;
    *)
      echo "Skipped: $description"
      ;;
  esac
}

run_step 'Update and upgrade the system?' 'system-update.sh'
run_step 'Install core packages?' 'install-core-packages.sh'
run_step 'Install development packages?' 'install-dev-packages.sh'
run_step 'Install workstation packages?' 'install-workstation-packages.sh'
run_step 'Install font packages?' 'install-font-packages.sh'
run_step 'Install AwesomeWM packages?' 'install-awesome-packages.sh'
run_step 'Link configuration files into your home directory?' 'link-configs.sh'

echo 'Bootstrap flow finished.'
