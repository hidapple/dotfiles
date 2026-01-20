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
ln -snv $DOT/zsh/zshenv  $HOME/.zshenv
mkdir -p $XDG_CONFIG_HOME/zsh
ln -snv $DOT/zsh/zshrc   $XDG_CONFIG_HOME/zsh/.zshrc
ln -snv $DOT/zsh/fzf     $XDG_CONFIG_HOME/zsh/fzf
ln -snv $DOT/zsh/fzf.zsh $XDG_CONFIG_HOME/zsh/fzf.zsh
ln -snv $DOT/zsh/k8s.zsh $XDG_CONFIG_HOME/zsh/k8s.zsh
ln -snv $DOT/zsh/gcp.zsh $XDG_CONFIG_HOME/zsh/gcp.zsh

# neovim
# -----------
mkdir -p $XDG_CONFIG_HOME/nvim
ln -snv $DOT/vim/vimrc $XDG_CONFIG_HOME/nvim/init.vim

# git
# -----------
ln -snv $DOT/git $XDG_CONFIG_HOME/git

# tmux
# -----------
ln -snv $DOT/tmux $XDG_CONFIG_HOME/tmux

# hammerspoon
# -----------
ln -snv $DOT/hammerspoon $XDG_CONFIG_HOME/hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
