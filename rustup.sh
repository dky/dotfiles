#!/bin/bash
#
sudo apt-get install gcc build-essential

curl https://sh.rustup.rs -sSf | sh -s -- -y
apt-get -y install fzf
cargo install navi
