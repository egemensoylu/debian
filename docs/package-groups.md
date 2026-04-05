# Package groups

This repository splits packages into three practical layers.

## core.txt

The minimum set that makes a Debian machine pleasant to use from the terminal.

Includes:
- networking basics
- archive utilities
- search and inspection tools
- tmux and vim
- Python base tooling

## dev.txt

Packages that are commonly needed for local development or building software.

Includes:
- compilers and make
- common development headers
- shellcheck
- clipboard helper tools

## workstation.txt

Optional GUI-oriented packages for a day-to-day Debian desktop.

Includes:
- browser
- office tools
- fonts
- media tools
- desktop utilities

Trim these lists based on the machine role. A personal laptop and a headless server should not necessarily use the same package set.
