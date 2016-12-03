#!/bin/sh
for f in .??*
do
  [[ $f == ".git" ]] && continue
  [[ $f == ".DS_Store" ]] && continue

  ln -snv ~/.dotfiles/$f ~/$f
done

# For neovim
mkdir -p $XDG_CONFIG_HOME/nvim
ln -snv ~/.vim $XDG_CONFIG_HOME/nvim
ln -snv ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

