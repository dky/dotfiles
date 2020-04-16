#!/bin/bash

#Install nvim from .appimage

FILE=https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
BIN_DIR=$HOME/bin

if [ ! -d $BIN_DIR ]; then
	mkdir -p $BIN_DIR;
fi

wget -qO- $FILE | tar xzvf - -C $BIN_DIR
ln -s $BIN_DIR/nvim-linux64/bin/nvim ~/bin/nvim




