# Debian Workstation Setup

Practical Debian bootstrap scripts, package lists, and dotfiles for turning a fresh install into a usable development workstation.

This repository collects the shell scripts, package manifests, configuration files, and notes I tend to reuse after installing Debian on a laptop, desktop, or server-like personal machine.

It is intentionally simple:
- readable shell scripts
- plain package lists
- portable config files
- no heavy framework or hidden automation

It is also Debian-first. Some scripts or package names may work on Debian derivatives, but Debian is the supported target.

## Goals

- make a fresh Debian machine productive quickly
- keep the setup understandable and easy to modify
- separate reusable configuration from machine-specific tweaks
- keep common developer and terminal tools close at hand
- keep an AwesomeWM setup modular instead of turning `rc.lua` into a dump

## Repository structure

```text
config/
  awesome/     modular AwesomeWM config scaffold
  bash/        shell aliases and shell snippets
  git/         starter Git config
  tmux/        tmux configuration
  vim/         vim configuration

docs/
  awesome-setup.md          AwesomeWM install and config notes
  docker.md                 Docker installation notes
  first-30-minutes.md       quick setup flow for a fresh machine
  package-groups.md         package categories and rationale
  post-install-checklist.md manual checklist after a fresh install
  vim-python-build.md       Python-enabled Vim build notes

packages/
  awesome.txt      optional AwesomeWM package group
  core.txt         essential CLI and system packages
  dev.txt          development-oriented packages
  fonts.txt        commonly used workstation fonts
  vim-build.txt    dependencies for building Vim with Python support
  workstation.txt  optional desktop/workstation tools

scripts/
  lib/common.sh                   shared shell helpers
  bootstrap.sh                    guided entry point
  system-update.sh                apt update/upgrade wrapper
  install-core-packages.sh        install packages/core.txt
  install-dev-packages.sh         install packages/dev.txt
  install-font-packages.sh        install packages/fonts.txt
  install-workstation-packages.sh install packages/workstation.txt
  install-awesome-packages.sh     install packages/awesome.txt
  install-vim-build-deps.sh       install packages/vim-build.txt
  install-docker.sh               install Docker from Docker's apt repo
  link-configs.sh                 symlink configs into HOME
  build-vim-with-python3.sh       optional custom Vim build script

.github/ISSUE_TEMPLATE/
  bug_report.md
  feature_request.md
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

### 4. Install optional workstation packages and fonts

```bash
./scripts/install-workstation-packages.sh
./scripts/install-font-packages.sh
```

### 5. Optional: install AwesomeWM packages

```bash
./scripts/install-awesome-packages.sh
```

### 6. Link the included configuration files

```bash
./scripts/link-configs.sh
```

### 7. Or run the guided bootstrap flow

```bash
./scripts/bootstrap.sh
```

### 8. Optional: install Docker

```bash
./scripts/install-docker.sh
```

### 9. Optional: build Vim with Python 3 support

```bash
./scripts/install-vim-build-deps.sh
./scripts/build-vim-with-python3.sh
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

- build tools and common headers
- Python venv tooling
- shellcheck and useful CLI helpers
- SSH and GPG client tooling

### Workstation extras

- Firefox ESR
- VLC
- LibreOffice
- image and document utilities
- network and Bluetooth helpers

### AwesomeWM extras

- a dedicated package group for AwesomeWM and common companions
- a modular `~/.config/awesome` scaffold
- a `local.lua` override example for machine-specific values
- autostart, keys, rules, theme, and widgets split into separate files

### Fonts

- DejaVu
- Fira Code
- Noto core, emoji, and CJK coverage

## AwesomeWM notes

The AwesomeWM setup here is meant to be practical, not flashy. It includes a clean base layout, common keybindings, a top bar, and a few sensible desktop helpers. If you want to keep using Awesome for years without hating your own config, modularity matters more than ricing tricks.

See [docs/awesome-setup.md](./docs/awesome-setup.md) for the layout and workflow.

## Notes

- Review every script before running it on a real machine.
- Package names and commands target Debian first.
- Some workstation packages are not relevant on minimal systems or servers.
- The config files are opinionated but easy to trim.
- AwesomeWM startup commands and wallpaper paths should be adjusted in `local.lua`.

## Inspired by other bootstrap projects

Repositories like `aburch/debootstrap` keep the project shape clear: a focused entry point, supporting scripts, documented usage, and a small amount of build/install scaffolding. This repo applies that idea to a personal Debian workstation rather than to a low-level base-system bootstrap tool.

## License

This repository is licensed under the GNU General Public License v3.0.
See the [LICENSE](./LICENSE) file for the full text.
