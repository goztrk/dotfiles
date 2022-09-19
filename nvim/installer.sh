#!/usr/bin/env bash

ISSUDO=$(sudo -l &> /dev/null);

if ! command -v nvim >/dev/null 2>&1
then
  if $ISSUDO
  then
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
  else
    mkdir -p $HOME/.programs
    wget -q0- https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | tar xvz - -C $HOME/.programs
  fi
fi


# Install custom config for ZionVim
if [ ! -L $HOME/.config/nvim ] && [ ! -e $HOME/.config/nvim ]
then
  ln -s ~/.dotfiles/nvim ~/.config/nvim
fi
