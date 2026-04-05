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
	if [ -f /etc/lsb-release ]; then
		sudo DEBIAN_FRONTEND=noninteractive apt-get -y install bats gcc g++ clang build-essential
	elif [ -f /etc/redhat-release ]; then
		sudo yum -y install gcc-c++
	fi
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
#if [ -d "$HOME/.config/ranger/plugins/ranger_devicons" ]
#then
    #echo "Ranger devicons exist, doing nothing"
#else
	#echo "Cloning ranger devicons"
	#git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
#fi

# Simlink nvim init.vim
ln -s $HOME/.config/nvim/init.vim .
