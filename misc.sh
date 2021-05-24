#!/bin/bash
# This script is to bootstrap Coc post nvim coc plugin install. It's mean't to suppliment anything we can't do after running plug install.

# Brew install bat for syntax highlighting with fzf
brew install bat

# Ranger devicons
if [ -d "~/.config/ranger/plugins/ranger_devicons" ] 
then
    echo "Ranger devicons exist, doing nothing" 
else
	echo "Cloning ranger devicons"
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
fi

# Coc
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
npm install coc-solargraph coc-css coc-dictionary coc-eslint coc-go coc-html coc-json coc-neosnippet coc-prettier coc-pyright coc-python coc-tsserver coc-vetur coc-yaml --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
