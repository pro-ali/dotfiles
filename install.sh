#! /bin/bash


# =========================================================================== #
# Title: install.sh
# Author: pro-ali
# Created: 2018-09-15
# Purpose: New installation of dot files
# =========================================================================== #

# NVIM
sudo apt install curl
mkdir -p nvim/dein/
cp -r ./nvim/ ~/.config/nvim/
sudo apt install neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./nvim/dein/installer.sh
sh ./nvim/dein/installer.sh ~/.config/nvim/dein/

# VIM
mkdir ~/.vim/
cp -r ./nvim/* ~/.vim/
rm ~/.vim/init.vim
cp ./nvim/init.vim ~/.vimrc
