#!/bin/sh
for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".vim" ]] && continue

  ln -snfv ~/.dotfiles/"$f" ~/"$f"
done

