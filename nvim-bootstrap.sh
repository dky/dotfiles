#!/bin/bash
#Assuming you are on a Debian/Ubuntu machine... Haven't tested this on any platform.
#Requires Python3.6.1, if you are on a release such as Ubuntu 16.04, Python will need to get upgraded.
#This was tested on Ubuntu 16.04.6 LTS
python_version(){
	PYTHON_VERSION=$(python3 -c 'import platform; print(platform.python_version())')
	#PYTHON_VERSION=3.6.2
	echo "Checking version of Python >= 3.6"
	# check if $PYTHON_VERSION is set at all
	[ -z $PYTHON_VERSION ] && return 1
	# If it's set, check the version
	if ! [[ $PYTHON_VERSION =~ (3.6.*) ]]; then
		return 1
	else
		return 0
	fi
}

install_python36(){
	#http://ubuntuhandbook.org/index.php/2017/07/install-python-3-6-1-in-ubuntu-16-04-lts/
	sudo add-apt-repository ppa:jonathonf/python-3.6
	sudo apt-get update
	sudo apt-get install python3.6

	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2

	sudo update-alternatives --config python3
}

nvim_bootstrap() {
	nvim -c PlugInstall +qall
	#Required for vim-go
	nvim -c GoInstallBinaries +qall
	nvim -c UpdateRemotePlugins +qall
	nvim -c checkhealth
}

go_bootstrap() {
	#Go completion for deoplete
	go get -u github.com/mdempsky/gocode
}

pip_bootstrap() {
	sudo apt-get install python3-pip
	#deoplete
	pip3 install --user pynvim
	#python autocompletion
	pip3 install jedi
}

if python_version
then
	echo "Python is above 3.6, installing pip and pip modules"
	pip_bootstrap
	nvim_bootstrap
	go_bootstrap
else
	echo "Python appears to be < 3.6, installing 3.6"
	install_python36
fi
