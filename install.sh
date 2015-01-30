#!/bin/bash

if [ -a $HOME/.vimrc ]
then
  echo "Backup .vimrc file to .vimrc_old"
  mv $HOME/.vimrc $HOME/.vimrc_old
fi

ln -s vimrc $HOME/.vimrc

echo "initializing submodules"
git submodule init
echo "updating submodules"
git submodule update

echo "installing all vim plugins defined on .vimrc file"
vim +PluginInstall +qall
