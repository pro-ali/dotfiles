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
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./nvim/dein/installer.sh
sh ./nvim/dein/installer.sh ~/.config/nvim/dein/
