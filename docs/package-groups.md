# Package groups

This repository splits packages into practical layers so a laptop, desktop, and minimal machine can share the same repo without installing everything.

## core.txt

The minimum set that makes a Debian machine pleasant to use from the terminal.

Includes:
- networking basics
- archive utilities
- search and inspection tools
- tmux and vim
- Python base tooling

## dev.txt

Packages that are commonly needed for local development or for building software.

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
- media tools
- desktop utilities

## fonts.txt

Extra font coverage for terminals, documents, browser rendering, and multilingual text.

## vim-build.txt

Development libraries and toolchain packages used when compiling Vim with Python 3 support.


## `packages/awesome.txt`

Optional package group for an X11 AwesomeWM workstation. It includes the window manager itself plus practical daily-use companions such as:

- compositor
- launcher
- wallpaper tool
- notification daemon
- network tray applet
- policy agent
- brightness, media, and audio helpers

Trim this list if the machine is not using AwesomeWM.
