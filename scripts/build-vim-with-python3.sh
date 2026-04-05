#!/usr/bin/env bash
set -euo pipefail

PYTHON_CONFIG_DIR="${PYTHON_CONFIG_DIR:-/usr/lib/python3.11/config-*}"
SOURCE_DIR="${SOURCE_DIR:-$HOME/src}"
VIM_REPO_DIR="$SOURCE_DIR/vim"

sudo apt update
sudo apt install -y \
  git \
  make \
  gcc \
  python3 \
  python3-dev \
  python3-distutils \
  libncurses-dev

mkdir -p "$SOURCE_DIR"

if [[ ! -d "$VIM_REPO_DIR/.git" ]]; then
  git clone https://github.com/vim/vim.git "$VIM_REPO_DIR"
fi

cd "$VIM_REPO_DIR/src"

./configure \
  --enable-python3interp \
  --with-python3-config-dir="$PYTHON_CONFIG_DIR" \
  --with-python3-command=/usr/bin/python3 \
  --without-x

make -j"$(nproc)"
sudo make install
/usr/local/bin/vim --version | sed -n '1,10p'
