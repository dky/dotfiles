#!/bin/bash
# Node version manager - Bootstrap node using nvm

# Install it, you should have the aliases already defined
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

source ~/.bashrc

# Install node
nvm install 23.11.0

# Install all the lsp cruft
#npm i -g pyright
npm i -g bash-language-server
#npm i -g dockerfile-language-server-nodejs
#npm i -g yaml-language-server
#npm i -g yarn
#npm i -g ansible-language-server
#npm i -g diagnostic-languageserver
#npm i -g vscode-langservers-extracted
