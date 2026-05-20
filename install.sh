#!/usr/bin/env bash

set -e

export XDG_CONFIG_HOME="$HOME/.config"

mkdir -p "$XDG_CONFIG_HOME"

# install required packages
sudo apt-get update
sudo apt-get install -y \
  git \
  curl \
  ripgrep \
  fzf

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

rm nvim-linux-x86_64.tar.gz

# add nvim to path
if ! grep -q '/opt/nvim-linux-x86_64/bin' "$HOME/.zshrc" 2>/dev/null; then
  echo 'export PATH="/opt/nvim-linux-x86_64/bin:$PATH"' >>"$HOME/.zshrc"
fi

export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

# install lazygit
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest |
  grep -Po '"tag_name": "v\K[^"]*')

curl -Lo lazygit.tar.gz \
  "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

rm -f lazygit lazygit.tar.gz

# symlink configs
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME/nvim"
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"

echo "done"
