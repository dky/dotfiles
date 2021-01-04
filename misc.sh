#!/bin/bash

# Ranger devicons
#git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# Coc
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
npm install coc-css coc-dictionary coc-eslint coc-go coc-html coc-json coc-neosnippet coc-pairs coc-prettier coc-pyright coc-python coc-tsserver coc-vetur coc-yaml --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
