#!/bin/bash

if [ -a $HOME/.vimrc ]
then
  echo "Do you wish to backup your .vimrc file?"
  select yn in "Yes" "No"; do
      case $yn in
          Yes )
            echo "Backup .vimrc file to .vimrc_old"
            mv $HOME/.vimrc $HOME/.vimrc_old
          break;;
          No )
            rm $HOME/.vimrc
            exit;;
      esac
  done
fi

echo "Do you wish to install the bash aliases?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
          ln -s $HOME/.vim/.bash_aliases $HOME/.bash_aliases
        break;;
        No ) exit;;
    esac
done

echo "initializing submodules"
git submodule init
echo "updating submodules"
git submodule foreach git pull origin master
git submodule update

ln -s $HOME/.vim/alexesba/colors $HOME/.vim/colors

echo "installing all vim plugins defined on .vimrc file"
vim +PluginInstall +qall
