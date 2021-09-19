#!/bin/bash
# This script is to bootstrap nvim

# Setup plug for nvim
if [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]
then
   echo "Plug already installed for nvim"
else
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

if [ "$(uname)" == "Darwin" ]; then
	# Brew install bat for syntax highlighting with fzf
	brew install bat
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	# These packages *should* be handled by terraform but just in case.
	sudo DEBIAN_FRONTEND=noninteractive apt-get -y install bats gcc g++ nodejs npm clang build-essential
	# Get latest fzf
	if [ -d "$HOME/.fzf" ]
	then
		echo ".fzf already exists"
	else
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		yes | ~/.fzf/install
		# Undo any modifications the .fzf.bash file
		git checkout ~/.dotfiles/.fzf.bash
	fi

	# setup lua custom dictionary
	lua_custom_dictionary_script="$HOME/.config/nvim/lua/compe-custom-dictionary.lua"
	if [ -L $lua_custom_dictionary_script ]
	then
		echo "nvim lua symlink script already exists, nuking it!"
		rm $lua_custom_dictionary_script
		ln -s $HOME/.dotfiles/lua/compe-custom-dictionary.lua $lua_custom_dictionary_script
	else
		echo "nvim lua doesn't exist, creating it"
		ln -s $HOME/.dotfiles/lua/compe-custom-dictionary.lua $lua_custom_dictionary_script
	fi

	if [ -d "$HOME/.vim-dictionary" ]
	then
		echo "vim-dictionary already exists, do nothing."
	else
		mkdir $HOME/.vim-dictionary && touch $HOME/.vim-dictionary/custom_dictionary.txt
	fi

	if [ -d "$HOME/bin" ]
	then
		if [ -f "$HOME/bin/nvim" ]
		then
			echo "nvim app-image already installed."
		else
			echo "nvim app-image not installed, fetching"
			wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage -O $HOME/bin/nvim && chmod u+x $HOME/bin/nvim
		fi
	else
		mkdir $HOME/bin
		wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage -O $HOME/bin/nvim && chmod u+x $HOME/bin/nvim
	fi
fi

# Ranger devicons
if [ -d "$HOME/.config/ranger/plugins/ranger_devicons" ] 
then
    echo "Ranger devicons exist, doing nothing" 
else
	echo "Cloning ranger devicons"
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
fi

# Install Coc - Switch to native LSP soon so we don't have this bloat
#if [ ! -d "~/.config/coc/extensions" ]; then
#mkdir -p ~/.config/coc/extensions
#cd ~/.config/coc/extensions
#npm install coc-dictionary --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
#fi
