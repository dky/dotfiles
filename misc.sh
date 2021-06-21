#!/bin/bash
# This script is to bootstrap Coc post nvim coc plugin install. It's mean't to suppliment anything we can't do after running plug install.

if [ "$(uname)" == "Darwin" ]; then
	# Brew install bat for syntax highlighting with fzf
	brew install bat
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "On Linux, installing nodejs, npm because this is required for Coc to work"
	sudo apt-get -y install nodejs npm
	# Get latest fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	y | ~/.fzf/install
	# Undo any modifications the .fzf.bash file
	git checkout ~/.dotfiles/.fzf.bash
fi

# Ranger devicons
if [ -d "~/.config/ranger/plugins/ranger_devicons" ] 
then
    echo "Ranger devicons exist, doing nothing" 
else
	echo "Cloning ranger devicons"
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
fi

# Install Coc - Switch to native LSP soon so we don't have this bloat
if [ ! -d "~/.config/coc/extensions" ]; then
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
npm install coc-solargraph coc-css coc-dictionary coc-eslint coc-go coc-html coc-json coc-neosnippet coc-prettier coc-pyright coc-python coc-tsserver coc-vetur coc-yaml --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
fi
