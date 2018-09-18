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
	VIMRC_REPO_FILE_PATH="./vim/.vimrc"
	VIMRC_TARGET_FILE_PATH="$HOME/.vimrc"
	VIM_REPO_DIR_PATH="./vim/.vim"
	VIM_TARGET_DIR_PATH="$HOME/.vimrc"
	DEIN_CACHE_DIR="$VIM_TARGET_DIR_PATH/dein"
	DEIN_INSTALLER_PATH="$DEIN_CACHE_DIR/installer.sh"
	DEIN_INSTALLER_URL="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"


