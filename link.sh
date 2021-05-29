#!/bin/sh
DOT="$HOME/.dotfiles"
XDG_CONFIG_HOME=$HOME/.config

cd `dirname $0`
for f in .??*
do
  if [ $f == ".git" ]; then continue; fi
  if [ $f == ".gitignore" ]; then continue; fi
  if [ $f == ".DS_Store" ]; then continue; fi

  ln -snv $DOT/$f $HOME/$f
done

# zsh
# -----------
ln -snv $DOT/zsh/zshrc   $HOME/.zshrc
ln -snv $DOT/zsh/fzf     $HOME/.fzf
ln -snv $DOT/zsh/fzf.zsh $HOME/.fzf.zsh
ln -snv $DOT/zsh/k8s.zsh $HOME/.k8s.zsh

# neovim
# -----------
ln -snv $DOT/vim/vimrc $XDG_CONFIG_HOME/nvim/init.vim

# git
# -----------
ln -snv $DOT/git $XDG_CONFIG_HOME/git
