#! /bin/bash


# =========================================================================== #
# Title: install.sh
# Author: pro-ali
# Created: 2018-09-15
# Purpose: New installation of dot files
# =========================================================================== #

# NVIM
sudo apt install curl
echo "\nInstall NVIM..."
if ! [ -d ~/.config/nvim/dein/ ]; then
	mkdir -p ~/.config/nvim/dein/
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./nvim/dein/installer.sh
	sh ./nvim/dein/installer.sh ~/.config/nvim/dein/
fi

if ! [ -f /usr/bin/nvim ]; then
	sudo apt install neovim
	cp -r ./nvim/ ~/.config/nvim/
fi


# VIM
echo "\nInstall VIM..."
if ! [ -d ~/.vim ]; then
	mkdir ~/.vim/
	cp -r ./nvim/* ~/.vim/
	rm ~/.vim/init.vim
fi
cp ./nvim/init_vimrc.vim ~/.vimrc

# BASHRC
echo "\nInstall .bashrc config..."
cp ./bashrc/.bashrc_server ~/.bashrc
