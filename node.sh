#!/bin/bash
# Node version manager - Bootstrap node using nvm

# Install it, you should have the aliases already defined
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

source ~/.bashrc

# Install latest version of node
nvm install node

# Install all the lsp cruft
npm install pyright
npm install bash-language-server
npm install dockerfile-language-server-nodejs
npm install yaml-language-server
npm install yarn
npm install ansible-language-server
npm install diagnostic-languageserver
