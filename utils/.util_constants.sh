#! /bin/bash


# =========================================================================== #
# Title: .util_constants.sh
# Author: ali-pro
# Created: 2018-09-18
# Purpose: Constants used in update.sh script
# =========================================================================== #

# GENERAL CONSTANTS ---------------------------------------------------------
    DOTFILES_ROOT_DIR="$PWD"

# VIM PACKAGE CONSTANTS -----------------------------------------------------
	# files
	VIMRC_TARGET_FILE_PATH="$HOME/.vimrc"
	VIMRC_REPO_FILE_PATH="./vim/.vimrc"
	# dirs
	VIM_TARGET_DIR_PATH="$HOME/.vim"
	VIM_REPO_DIR_PATH="./vim/.vim"

	# SOURCE https://github.com/Shougo/dein.vim#unixlinux-or-mac-os-x
	DEIN_CACHE_DIR="$HOME/.dein"
	DEIN_INSTALLER_PATH="$DEIN_CACHE_DIR/installer.sh"
	DEIN_INSTALLER_URL="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"
	DEIN_GITHUB_REPODIR="$DEIN_CACHE_DIR/repos/github.com"
	
	# SOURCE https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64
	VALLORIC_REPO_DIR="$DEIN_CACHE_DIR/repos/github.com/Valloric"
	YCM_REPO_DIR="$VALLORIC_REPO_DIR/YouCompleteMe"
	YCM_GIT_REQUEST_DIR="$YCM_REPO_DIR/third_party/requests_futures/.git"
	YCM_DEPENDENCY_INSTALL_STRING="sudo apt -y install build-essential cmake python-dev python3-dev"
	YCM_GIT_URL="https://github.com/Valloric/YouCompleteMe.git"



