#!/bin/sh
DOT="$HOME/.dotfiles"


cd `dirname $0`
for f in .??*
do
  if [ $f == ".git" ]; then continue; fi
  if [ $f == ".DS_Store" ]; then continue; fi

  ln -snv $DOT/$f $HOME/$f
done

# zsh
# -----------
ln -snv $DOT/zsh/zshrc   $HOME/.zshrc
ln -snv $DOT/zsh/fzf     $HOME/.fzf
ln -snv $DOT/zsh/fzf.zsh $HOME/.fzf.zsh

# neovim
# -----------
if [ "$XDG_CONFIG_HOME" == "" ]; then XDG_CONFIG_HOME=$HOME/.config; fi
mkdir -p $XDG_CONFIG_HOME/nvim
ln -snv $HOME/.vim   $XDG_CONFIG_HOME/nvim
ln -snv $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
