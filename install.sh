#!/bin/bash

if [ -a $HOME/.vimrc ]
then
  echo "Backup .vimrc file to .vimrc_old"
  mv $HOME/.vimrc $HOME/.vimrc_old
fi


echo "initializing submodules"
git submodule init
echo "updating submodules"
git submodule update
git submodule foreach git pull origin master

ln -s $HOME/.vim/alexesba/colors $HOME/.vim/colors

echo "installing all vim plugins defined on .vimrc file"
vim +PluginInstall +qall
