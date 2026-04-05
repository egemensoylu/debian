# Post-install checklist

Use this after a fresh Debian installation.

## System

- update package index
- upgrade installed packages
- verify timezone and locale
- confirm hostname
- enable sudo for the main user
- confirm firmware and microcode state

## Security

- install security updates
- configure SSH only if needed
- disable password SSH login on exposed machines
- enable a firewall if the machine is network-facing
- review which services start on boot

## Shell and editor

- link bash aliases
- link tmux config
- link vim config
- review the starter Git config
- confirm the default editor

## Workstation setup

- install browser
- install media tools
- install document viewer and office suite
- install fonts you actually use
- test sound, Bluetooth, suspend, brightness, and Wi-Fi

## Development setup

- install git and set user.name / user.email
- install Python tooling
- install build tools
- create SSH keys if needed
- test cloning a repository

## Backup and sync

- configure cloud sync if used
- set up backup destination
- export important dotfiles or secrets safely
