#!/usr/bin/env bash

set -e

export XDG_CONFIG_HOME="$HOME/.config"

mkdir -p "$XDG_CONFIG_HOME"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# load brew into current shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# install tools
brew install neovim
brew install ripgrep
brew install fzf
brew install lazygit
brew install deno
brew install tmux

# install TPM (tmux plugin manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# symlink configs
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.p10k.zsh" "$HOME/.p10k.zsh"

sudo apt-get update
sudo apt-get install -y locales

sudo locale-gen en_US.UTF-8

echo 'export LANG=en_US.UTF-8' >>~/.zshrc
echo 'export LC_ALL=en_US.UTF-8' >>~/.zshrc

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
