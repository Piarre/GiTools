#!/bin/sh

if [ ! -d "$HOME/.gitools" ]; then
  mkdir "$HOME/.gitools"
fi

# shellcheck disable=SC2164
cd "$HOME/.gitools"

# Check if we use curl or wget
if [ -x "$(command -v curl)" ]; then
  curl -LJk https://github.com/Piarre/GiTools/releases/download/v1.0.0/gitools -o gitools
elif [ -x "$(command -v wget)" ]; then
  wget --no-check-certificate --content-disposition https://github.com/Piarre/GiTools/releases/download/v1.0.0/gitools
# shellcheck disable=SC1073
if
if [ ! -f ~/.bashrc ]; then
  touch ~/.bashrc
fi
echo 'Adding GiTools to PATH'
echo '' >>~/.bashrc
echo '# GiTools' >>~/.bashrc
echo 'export PATH=$PATH:"$HOME/.gitools"' >>~/.bashrc
echo 'GiTools added, please restart your terminal.'
