#!/bin/bash

apt update -y
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
NEW_PATH="~/nvim-linux64/bin:$HOME/.cargo/bin:/root/.local/bin"
if [[ ":$PATH:" == *":$NEW_PATH:"* ]]; then
    echo "Path is already in the PATH variable"
else
    # Add the path to the PATH variable
    echo "Adding path to the PATH variable"
    echo "export PATH=\$PATH:$NEW_PATH" >> ~/.bashrc
    source ~/.bashrc
fi
apt install build-essential -y
apt install curl -y
apt install git -y
apt install make -y
apt install python -y
apt install node -y
apt install npm -y
curl https://sh.rustup.rs -sSf | sh
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
