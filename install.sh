#!/usr/bin/env bash
#
# This installation is destructive, as it removes exisitng files/directories.
# Use at your own risk.
# This came from mitchellh's dotfiles git repo.  I modified it to suite my needs - dkynyc

for name in `find . -maxdepth 1 -iname ".*" -type f | sed -e 's/\.\// /'`; do 
  if [ ! $name == ".gitignore" -a ! $name == "install.sh" ]; then
    target="$HOME/$name"

    if [ -h $target ]; then
		rm $target
    elif [ -d $target ]; then
      rm -rf $target
    fi

    ln -s "$PWD/$name" "$target"
    echo "Linked $PWD/$name to $target."
  fi
done


#setup bundler
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
