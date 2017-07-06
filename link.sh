#!/bin/sh
cd `dirname $0`
for f in .??*
do
  if [ $f == ".git" ]; then continue; fi
  if [ $f == ".DS_Store" ]; then continue; fi

  ln -snv ~/.dotfiles/$f ~/$f
done

# neovim
mkdir -p $XDG_CONFIG_HOME/nvim
ln -snv ~/.vim $XDG_CONFIG_HOME/nvim
ln -snv ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

# peco
ln -snv ~/.dotfiles/peco/config.json $XDG_CONFIG_HOME/peco/config.json

