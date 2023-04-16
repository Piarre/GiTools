#!/bin/sh

if [ ! -d "$HOME/.gitools" ]; then
  mkdir "$HOME/.gitools"
fi

# shellcheck disable=SC2164
cd "$HOME/.gitools"
curl -k https://raw.githubusercontent.com/Piarre/GiTools/main/gitools -o gitools
if [ ! -f ~/.bashrc ]; then
  touch ~/.bashrc
fi
echo 'Adding GiTools to PATH'
echo '' >>~/.bashrc
echo '# GiTools' >>~/.bashrc
echo 'export PATH=$PATH:"$HOME/.gitools"' >>~/.bashrc
echo 'GiTools added, please restart your terminal.'
