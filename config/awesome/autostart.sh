#!/usr/bin/env bash
set -euo pipefail

run_once() {
  local command="$1"
  local process_name="${2:-${1%% *}}"

  if ! pgrep -u "$USER" -fx "$command" >/dev/null 2>&1 && ! pgrep -u "$USER" -x "$process_name" >/dev/null 2>&1; then
    nohup sh -lc "$command" >/dev/null 2>&1 &
  fi
}

run_once "xsettingsd"
run_once "nm-applet"
run_once "blueman-applet"
run_once "dunst"
run_once "picom"
