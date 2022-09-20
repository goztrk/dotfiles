if [ ! -d $HOME/.nvm ]
then
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source ~/.zshrc
  nvm install --lts
  success 'NodeJS installed'
fi
