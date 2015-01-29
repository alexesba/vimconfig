#!/bin/bash
DIRECTORY=$HOME/.vim
if [ -f "$HOME/.vimrc" ]; then
  echo 'backup the version of .vimrc file to .vimrc_old'
  mv $HOME/.vimrc $HOME/.vimrc_old
fi

if [ -d "$DIRECTORY" ]; then
  echo 'moving the version of .vim folder to .vim_old' 
  mv $HOME/.vim $HOME/.vim_old
fi

echo "creating new .vim directory and"
mkdir $HOME/.vim/ && cd $HOME/.vim/
mkdir bundle
mkdir tmp/swap
mkdir tmp/undo

