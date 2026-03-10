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

# fish
# -----------
mkdir -p $XDG_CONFIG_HOME/fish
ln -snv $DOT/fish/config.fish $XDG_CONFIG_HOME/fish/config.fish
ln -snv $DOT/fish/functions   $XDG_CONFIG_HOME/fish/functions
ln -snv $DOT/fish/conf.d      $XDG_CONFIG_HOME/fish/conf.d

# neovim
# -----------
mkdir -p $XDG_CONFIG_HOME/nvim
ln -snv $DOT/vim/vimrc $XDG_CONFIG_HOME/nvim/init.vim
ln -snv $DOT/vim/coc-settings.json $XDG_CONFIG_HOME/nvim/coc-settings.json

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

# ghostty
# -----------
ln -snv $DOT/ghostty $XDG_CONFIG_HOME/ghostty
