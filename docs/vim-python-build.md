# Building Vim with Python 3 support

Debian's packaged Vim is enough for many setups, but sometimes I want a locally built Vim with explicit Python 3 support.

## Install build dependencies

```bash
./scripts/install-vim-build-deps.sh
```

## Build Vim

```bash
./scripts/build-vim-with-python3.sh
```

## Default behavior

The build script:
- clones or updates `https://github.com/vim/vim.git`
- configures Vim with Python 3 support enabled
- installs under `/usr/local`
- prints the first lines of `vim --version` at the end

## Useful overrides

```bash
VIM_SOURCE_DIR="$HOME/src/vim"     INSTALL_PREFIX="$HOME/.local"     WITH_X11=1     ./scripts/build-vim-with-python3.sh
```

## Notes

- `WITH_X11=0` keeps the build terminal-focused.
- `WITH_X11=1` enables GUI autodetection if the required libraries are present.
- Override `PYTHON_BIN` or `PYTHON_CONFIG_DIR` if your Debian/Python layout is different.


## Suggested layout

A simple source/build layout that works well on Debian:

```text
$HOME/src/vim/        Vim git checkout
/usr/local/bin/vim    installed binary
```

You can override these with environment variables before running the script:

```bash
VIM_SOURCE_DIR="$HOME/src/vim" INSTALL_PREFIX="/usr/local" ./scripts/build-vim-with-python3.sh
```
