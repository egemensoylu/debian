# First 30 minutes on a fresh Debian machine

This is the quick path I would usually take after a clean install.

## 1. Update the base system

```bash
./scripts/system-update.sh
```

## 2. Install terminal essentials

```bash
./scripts/install-core-packages.sh
```

## 3. Install developer tooling

```bash
./scripts/install-dev-packages.sh
```

## 4. Install workstation extras if this is a desktop or laptop

```bash
./scripts/install-workstation-packages.sh
./scripts/install-font-packages.sh
```

## 5. Link dotfiles

```bash
./scripts/link-configs.sh
```

## 6. Set Git identity

Copy `config/git/gitconfig.example` into your own Git config and set your name and email.

## 7. Optional additions

- Docker: `./scripts/install-docker.sh`
- Python-enabled Vim: `./scripts/install-vim-build-deps.sh && ./scripts/build-vim-with-python3.sh`


## Optional: if this machine uses AwesomeWM

```bash
./scripts/install-awesome-packages.sh
./scripts/link-configs.sh
```

Then copy `~/.config/awesome/local.lua` from the example and adjust terminal, browser, wallpaper, and autorun entries to match the machine.
