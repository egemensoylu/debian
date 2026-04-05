# Debian Workstation Setup

A practical Debian bootstrap repository for turning a fresh installation into a usable development workstation.

This repo collects the shell scripts, package lists, configuration files, and notes I tend to reuse after installing Debian on a laptop, desktop, or server-like personal machine.

It is intentionally simple:
- readable shell scripts
- plain package manifests
- portable config files
- no heavy framework or one-click black box

## Goals

- make a fresh Debian machine productive quickly
- keep the setup understandable and easy to modify
- separate reusable configuration from machine-specific tweaks
- keep common developer and terminal tools close at hand

## Repository structure

```text
config/
  bash/        shell aliases and shell snippets
  tmux/        tmux configuration
  vim/         vim configuration

docs/
  package-groups.md          package categories and rationale
  post-install-checklist.md  manual checklist after a fresh install

packages/
  core.txt        essential CLI and system packages
  dev.txt         development-oriented packages
  workstation.txt optional desktop/workstation tools

scripts/
  bootstrap.sh                 guided entry point
  system-update.sh             apt update/upgrade wrapper
  install-core-packages.sh     install packages/core.txt
  install-dev-packages.sh      install packages/dev.txt
  install-workstation-packages.sh install packages/workstation.txt
  link-configs.sh              symlink configs into HOME
  build-vim-with-python3.sh    optional custom Vim build script
```

## Quick start

### 1. Update the system

```bash
./scripts/system-update.sh
```

### 2. Install core packages

```bash
./scripts/install-core-packages.sh
```

### 3. Install developer packages

```bash
./scripts/install-dev-packages.sh
```

### 4. Install optional workstation packages

```bash
./scripts/install-workstation-packages.sh
```

### 5. Link the included configuration files

```bash
./scripts/link-configs.sh
```

### 6. Or run the guided bootstrap script

```bash
./scripts/bootstrap.sh
```

## What is included

### Core essentials

- certificates, curl, wget, git
- shell quality-of-life tools
- archive and file utilities
- tmux, vim, less, tree, rsync
- ripgrep, fd, jq, fzf, htop
- Python basics and pipx

### Development basics

- build-essential and common headers
- Python venv tooling
- shellcheck and useful CLI helpers
- SSH/GPG support

### Workstation extras

- Firefox ESR
- VLC
- LibreOffice
- Image/document utilities
- Network and Bluetooth helpers

## Notes

- The scripts are intentionally conservative. Review them before running.
- Package names target Debian first.
- Some workstation packages may not be relevant on minimal systems or servers.
- The config files are opinionated but easy to trim.

## Suggested next improvements

- add GNOME/KDE specific setup scripts
- add fonts and terminal theme notes
- add Docker and Node.js optional setup
- add laptop-specific power management notes
- add secure backup and restore helpers

## License

This repository is licensed under the GNU General Public License v3.0.
See the [LICENSE](./LICENSE) file for the full text.
