#!/usr/bin/env bash

set -e

export XDG_CONFIG_HOME="$HOME/.config"

mkdir -p "$XDG_CONFIG_HOME"

# Install Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" &&
  brew install neovim

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" &&
  brew install ripgrep

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" &&
  brew install fzf

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" &&
  brew install lazygit

# symlink configs
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.p10k.zsh" "$HOME/.p10k.zsh"

echo "done — run: nvim"
