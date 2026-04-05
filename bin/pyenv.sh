#!/usr/bin/env bash

curl -fsSL https://pyenv.run | bash

# Python deps for pyenv
sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
