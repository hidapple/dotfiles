# dotfiles
Configuration files for Unix tools.

## Install
Clone into `~/.dotfiles`.
```sh
$ git clone https://github.com/hidapple/dotfiles.git ~/.dotfiles
```

Then execute `link.sh` to make symbolic links of each dotfile.
```sh
# Install vim-plug
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Setup dotfiles
$ sh $HOME/.dotfiles/link.sh
```
