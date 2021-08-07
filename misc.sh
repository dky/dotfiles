#!/bin/bash
# This script is to bootstrap compose + ctop

function download() {
	curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o $HOME/bin/docker-compose
	curl -L "https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64" -o $HOME/bin/ctop
	chmod u+x ~/bin/docker-compose
	chmod u+x ~/bin/ctop
}

if [ -d "$HOME/bin" ]
then
	download
else
	mkdir $HOME/bin
	download
fi
