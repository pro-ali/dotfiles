#! /bin/bash


# =========================================================================== #
# Title: update.sh
# Author: ali-pro
# Created: 2018-09-17
# Purpose: update all dotfile packages
# =========================================================================== #


# SOURCE --------------------------------------------------------------------
	source ./utils/.util_constants.sh
		# USED CONSTANTS
		# --------------
		#	DOTFILES_ROOT_DIR
		#   VIMRC_REPO_FILE_PATH
		#   VIMRC_TARGET_FILE_PATH
		#   VIM_REPO_DIR_PATH
		#   VIM_TARGET_DIR_PATH
		#   DEIN_CACHE_DIR
		#   DEIN_INSTALLER_URL
		#   DEIN_INSTALLER_PATH

	source ./utils/.util_functions.sh
		# USED FUNCTIONS
		# --------------
		#	install_apt_command
		#	replace_bashrc
		#	synd_file
		#	synd_dir


echo
# SCRIPT USAGE CONTROL ( only run if file [./.permit_update] exists ) ------
    [ ! -f "./.permit_update" ] &&
        echo "\"root_dir/.permit_update\" file absent. " &&
        echo "It is required to execute update.sh." && echo &&
        exit 1;
	echo "PROCEEDING WITH ./update.sh script"


# CHECK AND INSTALL PROGRAMMES ---------------------------------------------
	install_apt_command "tree"
	install_apt_command "curl"


# PACKAGES AND COMMANDS ----------------------------------------------------

    print_title "# BASHRC PACKAGE --------------------------------------------------------"
    replace_bashrc "$DOTFILES_ROOT_DIR"; echo

    print_title "# VIM PACKAGE -----------------------------------------------------------"
	echo "1-- SYNC ~/.vimrc.."; sync_file 	$VIMRC_TARGET_FILE_PATH $VIMRC_REPO_FILE_PATH
	echo "2-- SYNC ~/.vim/..";	 sync_dir 	$VIM_TARGET_DIR_PATH 	$VIM_REPO_DIR_PATH; echo
	echo "3-- CHECK DEIN INSTALLATION" &&
		if [ ! -d "$DEIN_CACHE_DIR" ]; then
			echo "   :INSTALLING DEIN:"
			mkdir -p $DEIN_CACHE_DIR
			curl $DEIN_INSTALLER_URL > $DEIN_INSTALLER_PATH
			sh $DEIN_INSTALLER_PATH $DEIN_CACHE_DIR
		else
			echo "   :DEIN EXISTS SO NOT INSTALLING:"
		fi; echo


# script not to be sourced
exit 0
