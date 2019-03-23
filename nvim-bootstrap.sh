#!/bin/bash

#Assuming you are on a Debian/Ubuntu machine... Haven't tested this on any platform.
#Requires Python3.6.1, if you are on a release such as Ubuntu 16.04, Python will need to get upgraded.

python_version(){
	PYTHON_VERSION=$(python3 -c 'import platform; print(platform.python_version())')
	echo "Checking version of Python >= 3.6"
	echo $PYTHON_VERSION
	# check if $PYTHON_VERSION is set at all
	[ -z $PYTHON_VERSION ] && return 1
	# If it's set, check the version

}

python_version
#nvim_plugins(){
	##nvim -c PlugInstall
	##nvim -c GoInstallBinaries
	##nvim -c UpdateRemotePlugins
	##nvim -c checkHealth
	##Go completion for deoplete
	##go get -u github.com/mdempsky/gocode
#}

#if version_above_36
#then
#	echo "Python is above 3.6, installing pip and pip modules"
#	sudo apt-get install python3-pip
#	#deoplete
#	pip3 install --user pynvim
	#python autocompletion
#	pip3 install jedi
#else
#	echo "Python appears to be < 3.6"
#	exit
#fi
