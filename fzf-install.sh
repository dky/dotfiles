#!/bin/bash

FZF_DIR=~/.fzf

if [ ! -d $FZF_DIR ]; then
	echo "Directory $FZF_DIR exists."
	rm -rf $FZF_DIR
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	$FZF_DIR/install
fi
