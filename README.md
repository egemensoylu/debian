# Debian Workstation Setup

Practical Debian bootstrap scripts, package lists, and modular dotfiles for turning a fresh install into a clean, usable development workstation.

![Debian](https://img.shields.io/badge/Debian-12-A81D33?logo=debian&logoColor=white)
![AwesomeWM](https://img.shields.io/badge/AwesomeWM-window%20manager-535D6C?logo=awesomewm&logoColor=white)
![Vim](https://img.shields.io/badge/Vim-editor-019733?logo=vim&logoColor=white)
![tmux](https://img.shields.io/badge/tmux-terminal%20multiplexer-1BB91F?logo=tmux&logoColor=white)
![Bash](https://img.shields.io/badge/Shell-Bash-121011?logo=gnubash&logoColor=white)
![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)

This repository collects the shell scripts, package manifests, configuration files, and notes I tend to reuse after installing Debian on a laptop, desktop, or personal workstation.

> Debian-first, shell-first, and intentionally simple.  
> No heavy framework, no hidden magic, and no giant one-file config dumps.

## Why this repo exists

A fresh Debian install is a great starting point, but getting from a clean system to a comfortable daily machine usually means repeating the same work:

- updating the base system
- installing a solid CLI toolkit
- adding development packages
- linking known-good config files
- setting up a window manager and terminal workflow
- keeping machine-specific tweaks separate from reusable defaults

This repo is my answer to that repetition.

## Design principles

- **Readable scripts** instead of opaque automation
- **Plain package lists** instead of overengineered tooling
- **Reusable config files** with room for local overrides
- **Debian-first support** instead of pretending every distro is identical
- **Modular AwesomeWM setup** instead of turning `rc.lua` into an unmaintainable dump

## Quick start

### Guided path

Run the guided bootstrap flow:

```bash
./scripts/bootstrap.sh
```

### Manual path

```bash
./scripts/system-update.sh
./scripts/install-core-packages.sh
./scripts/install-dev-packages.sh
./scripts/install-workstation-packages.sh
./scripts/install-font-packages.sh
./scripts/install-awesome-packages.sh
./scripts/link-configs.sh
```

### Optional extras

Install Docker:

```bash
./scripts/install-docker.sh
```

Build Vim with Python 3 support:

```bash
./scripts/install-vim-build-deps.sh
./scripts/build-vim-with-python3.sh
```

## Installation profiles

### Core
The base command-line and system packages I want almost everywhere.

Includes things like:
- `curl`, `wget`, `git`, `ca-certificates`
- archive and file utilities
- `tmux`, `vim`, `less`, `tree`, `rsync`
- `ripgrep`, `fd`, `jq`, `fzf`, `htop`
- Python basics and `pipx`

### Development
Packages for compiling, scripting, and working comfortably on a development machine.

Includes things like:
- build tools and common headers
- Python venv tooling
- `shellcheck`
- SSH and GPG client tooling

### Workstation
Desktop-oriented tools for a non-minimal machine.

Includes things like:
- Firefox ESR
- VLC
- LibreOffice
- image and document utilities
- network and Bluetooth helpers

### AwesomeWM
A practical AwesomeWM setup with sensible defaults and a modular config layout.

Includes:
- a dedicated AwesomeWM package group
- a modular `~/.config/awesome` scaffold
- `local.lua` override support for machine-specific values
- separate files for autostart, keys, rules, theme, signals, and widgets

### Fonts
A small but useful font selection for terminal and desktop use.

Includes:
- DejaVu
- Fira Code
- Noto core, emoji, and CJK coverage

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

## AwesomeWM notes

The AwesomeWM side of this repo is meant to stay practical, not flashy.

The goal is to have:
- a clean base layout
- common keybindings
- a sane top bar
- a few desktop helpers
- machine-specific overrides without contaminating the shared config

If you plan to keep using AwesomeWM long term, modularity matters more than ricing tricks.

See [docs/awesome-setup.md](./docs/awesome-setup.md) for setup and workflow details.

## Safety and scope

Before running anything:

- read the scripts
- verify package names
- adjust machine-specific values
- decide which package groups actually make sense for the target machine

A few important notes:

- This repo is **Debian-first**.
- Some package names may work on Debian derivatives, but Debian is the supported target.
- Some workstation packages do not belong on a minimal system or server.
- The config files are opinionated, but they are meant to be easy to trim.
- AwesomeWM startup commands and wallpaper paths should be adjusted in `local.lua`.

## Inspired by other bootstrap projects

Projects like `aburch/debootstrap` are useful reminders that a good setup repo should stay focused:
- clear entry points
- small supporting scripts
- documented usage
- lightweight scaffolding

This repository applies that spirit to a personal Debian workstation rather than to a low-level base-system bootstrap tool.

## License

This repository is licensed under the GNU General Public License v3.0.  
See the [LICENSE](./LICENSE) file for the full text.
