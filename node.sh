#!/bin/bash
# Node version manager - Bootstrap node using nvm

# Install it, you should have the aliases already defined
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

source ~/.bashrc

# Install 18.x version of node
nvm install 18.0.0

# Install all the lsp cruft
npm i -g pyright
npm i -g bash-language-server@1.17.0
npm i -g dockerfile-language-server-nodejs
npm i -g yaml-language-server
npm i -g yarn
npm i -g ansible-language-server
npm i -g diagnostic-languageserver
npm i -g vscode-langservers-extracted
