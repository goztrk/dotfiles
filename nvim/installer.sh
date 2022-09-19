#!/usr/bin/env bash

ISSUDO=$(sudo -l &> /dev/null);

if command -v nvim >/dev/null 2>&1
then
  exit
fi

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

# Install NvChad
if [ ! -f $HOME/.config/nvim/init.lua ]
then
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
fi

# Install custom config for nvchad
if [ ! -L $HOME/.config/nvim/lua/custom ] && [ ! -e $HOME/.config/nvim/lua/custom ]
then
  ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim/lua/custom
fi
