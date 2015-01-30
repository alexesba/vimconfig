#!/bin/bash

if [ -a $HOME/.vimrc ]
then
  echo "Backup .vimrc file to .vimrc_old"
  mv $HOME/.vimrc $HOME/.vimrc_old
fi

ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/bundle/colors $HOME/.vim/colors

echo "initializing submodules"
git submodule init
echo "updating submodules"
git submodule update
git submodule foreach git pull origin master

echo "installing all vim plugins defined on .vimrc file"
vim +PluginInstall +qall
