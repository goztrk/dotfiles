#!/usr/bin/env bash

if ! command -v zsh &> /dev/null
then
  ISSUDO=$(sudo -l &> /dev/null)
  if $ISSUDO
  then
    sudo apt-get instal -qq zsh
  fi
fi

if [ ! -d $HOME/.oh-my-zsh ]
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
