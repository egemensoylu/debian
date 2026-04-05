#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

VIM_WORKDIR="${VIM_WORKDIR:-$HOME/src}"
VIM_SOURCE_DIR="${VIM_SOURCE_DIR:-$VIM_WORKDIR/vim}"
INSTALL_PREFIX="${INSTALL_PREFIX:-/usr/local}"
PYTHON_BIN="${PYTHON_BIN:-/usr/bin/python3}"
WITH_X11="${WITH_X11:-0}"

if ! command -v git >/dev/null 2>&1; then
  echo 'git is required. Run ./scripts/install-vim-build-deps.sh first.' >&2
  exit 1
fi

if [[ ! -x "$PYTHON_BIN" ]]; then
  echo "Python binary not found: $PYTHON_BIN" >&2
  exit 1
fi

PYTHON_VERSION="$($PYTHON_BIN -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
PYTHON_CONFIG_DIR="${PYTHON_CONFIG_DIR:-/usr/lib/python${PYTHON_VERSION}/config-${PYTHON_VERSION}-$(dpkg-architecture -qDEB_BUILD_GNU_TYPE)}"

if [[ ! -d "$PYTHON_CONFIG_DIR" ]]; then
  echo "Python config dir not found: $PYTHON_CONFIG_DIR" >&2
  echo 'Install build dependencies first or override PYTHON_CONFIG_DIR.' >&2
  exit 1
fi

mkdir -p "$VIM_WORKDIR"
mkdir -p "$(dirname -- "$VIM_SOURCE_DIR")"

if [[ ! -d "$VIM_SOURCE_DIR/.git" ]]; then
  git clone https://github.com/vim/vim.git "$VIM_SOURCE_DIR"
else
  git -C "$VIM_SOURCE_DIR" pull --ff-only
fi

cd "$VIM_SOURCE_DIR"
make distclean >/dev/null 2>&1 || true

configure_args=(
  --prefix="$INSTALL_PREFIX"
  --with-features=huge
  --enable-multibyte
  --enable-cscope
  --enable-terminal
  --enable-python3interp=yes
  --with-python3-command="$PYTHON_BIN"
  --with-python3-config-dir="$PYTHON_CONFIG_DIR"
)

if [[ "$WITH_X11" == "1" ]]; then
  configure_args+=(--enable-gui=auto)
else
  configure_args+=(--without-x)
fi

./configure "${configure_args[@]}"
make -j"$(nproc)"
sudo make install

"$INSTALL_PREFIX/bin/vim" --version | sed -n '1,12p'
