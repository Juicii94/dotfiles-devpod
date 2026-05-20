#!/usr/bin/env bash

set -e

export XDG_CONFIG_HOME="$HOME/.config"

mkdir -p "$XDG_CONFIG_HOME"

# install homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# load brew into current shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# install tools
brew list neovim >/dev/null 2>&1 || brew install neovim
brew list ripgrep >/dev/null 2>&1 || brew install ripgrep
brew list fzf >/dev/null 2>&1 || brew install fzf
brew list lazygit >/dev/null 2>&1 || brew install lazygit
brew list deno >/dev/null 2>&1 || brew install deno
brew list tmux >/dev/null 2>&1 || brew install tmux

# install TPM (tmux plugin manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# install Powerlevel10k (official setup)
if [ ! -d "$HOME/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$HOME/powerlevel10k"
fi

# symlink configs
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.p10k.zsh" "$HOME/.p10k.zsh"

sudo apt-get update
sudo apt-get install -y locales
sudo locale-gen en_US.UTF-8
