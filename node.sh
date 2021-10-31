#!/bin/bash
# Node version manager - Bootstrap node using nvm

# Install it, you should have the aliases already defined
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

source ~/.bashrc

# Install latest version of node
nvm install node

# Install all the lsp cruft
npm -g install pyright
npm -g install bash-language-server
npm -g install dockerfile-language-server-nodejs
npm -g install yaml-language-server
npm -g install yarn
npm -g install ansible-language-server
