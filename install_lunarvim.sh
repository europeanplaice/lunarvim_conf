#!/bin/bash

# Update package lists and install required packages
cd /
apt update -y
apt install wget build-essential curl git make nodejs npm python3 -y

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz
NVIM_DIR="$HOME/nvim-linux64"
export PATH="$NVIM_DIR/bin:$HOME/.cargo/bin:/root/.local/bin/lvim:$PATH"

# Check if the path is already in the PATH variable
if [[ ":$PATH:" == *":$NVIM_DIR/bin:\$HOME/.cargo/bin:/root/.local/bin/lvim:"* ]]; then
  echo "Path is already in the PATH variable"
else
  # Add the path to the PATH variable
  echo "Adding path to the PATH variable"
  echo "export PATH=\"$NVIM_DIR/bin:\$HOME/.cargo/bin:/root/.local/bin/lvim:\$PATH\"" >> ~/.bashrc
fi
source ~/.bashrc

# Install Rustup
curl https://sh.rustup.rs -sSf | sh

# Install LunarVim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
