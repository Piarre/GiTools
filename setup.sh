#!/bin/sh

LATEST_RELEASE=$(curl -ks https://api.github.com/repos/Piarre/GiTools/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
if [ ! -d "$HOME/.gitools" ]; then
  mkdir "$HOME/.gitools"
fi
cd "$HOME/.gitools"
curl -LJk https://github.com/Piarre/GiTools/releases/download/$LATEST_RELEASE/gitools -o gitools
if [ ! -f ~/.bashrc ]; then
  touch ~/.bashrc
fi
echo 'Adding GiTools to PATH'
echo '' >>~/.bashrc
echo '# GiTools' >>~/.bashrc
echo 'export PATH=$PATH:"$HOME/.gitools"' >>~/.bashrc
echo 'GiTools added, please restart your terminal.'
