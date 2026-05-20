#!/usr/bin/env bash

set -e

export XDG_CONFIG_HOME="$HOME/.config"

mkdir -p "$XDG_CONFIG_HOME"

# install homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  NONINTERACTIVE=1 bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# load brew into current shell
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "brew not found"
  exit 1
fi

# install tools
brew install neovim ripgrep fzf lazygit

# install LazyVim starter
if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
  git clone https://github.com/LazyVim/starter "$XDG_CONFIG_HOME/nvim"
  rm -rf "$XDG_CONFIG_HOME/nvim/.git"
fi

# symlink configs
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.p10k.zsh" "$HOME/.p10k.zsh"

echo "done — run: nvim"
