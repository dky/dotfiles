#!/bin/bash
#
sudo apt-get -y install gcc build-essential fzf

curl https://sh.rustup.rs -sSf | sh -s -- -y
cargo install navi
