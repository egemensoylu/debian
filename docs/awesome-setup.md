# AwesomeWM setup

This repository ships an optional AwesomeWM package group and a modular config scaffold.

## What gets installed

The `packages/awesome.txt` group focuses on a practical daily-driver setup:

- `awesome` for the window manager
- `picom` for compositing
- `rofi` for launching applications
- `feh` for wallpapers
- `arandr` for monitor layout
- `dunst` for notifications
- `network-manager-gnome` for a tray applet
- `policykit-1-gnome` for privilege prompts
- `brightnessctl`, `playerctl`, `pamixer`, `pavucontrol`, `blueman` for common desktop controls

## Install the package group

```bash
./scripts/install-awesome-packages.sh
```

Or from the Makefile:

```bash
make awesome
```

## Link the config

```bash
./scripts/link-configs.sh
```

That links the shared AwesomeWM files into `~/.config/awesome` and keeps your personal override file separate.

If no local override file exists, the script also creates:

- `~/.config/awesome/local.lua`

from:

- `config/awesome/local.lua.example`

## Configuration layout

```text
config/awesome/
  autostart.sh
  keys.lua
  local.lua.example
  rc.lua
  rules.lua
  signals.lua
  themes/egemen/theme.lua
  widgets/init.lua
```

The goal is to keep the Awesome setup readable and easy to extend.

## Local overrides

Use `local.lua` for machine-specific values such as:

- default terminal or browser
- wallpaper path
- preferred apps
- host-specific startup commands
- tag names

The example file is intentionally small.

## First login tips

- Test config changes with `awesome -k` before restarting the WM.
- Reload with `Mod4 + Ctrl + r`.
- Open a terminal with `Mod4 + Enter`.
- Use `Mod4 + r` to open rofi.
- Use `Mod4 + Shift + q` to quit the current Awesome session.

## Notes

- This config targets X11 AwesomeWM, not Wayland compositors.
- Some helper programs are optional; trim the package list to your taste.
- On a minimal Debian install, make sure you also have an X session/display manager path that suits your machine.
