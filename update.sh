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
		#   VALLORIC_REPO_DIR
		#   YCM_REPO_DIR
		#   YCM_DEPENDENCY_INSTALL_STRING
		#   YCM_GIT_URL
		#   YCM_GIT_REQUEST_DIR


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
	install_apt_command "git"


# PACKAGES AND COMMANDS ----------------------------------------------------

    print_title "# BASHRC PACKAGE --------------------------------------------------------"
    replace_bashrc "$DOTFILES_ROOT_DIR"; echo

    print_title "# VIM PACKAGE -----------------------------------------------------------"
	echo "1-- SYNC [$VIMRC_TARGET_FILE_PATH]" 	&& 	sync_file 	$VIMRC_TARGET_FILE_PATH $VIMRC_REPO_FILE_PATH; echo
	echo "2-- SYNC [$VIM_TARGET_DIR_PATH]"		&&	sync_dir 	$VIM_TARGET_DIR_PATH 	$VIM_REPO_DIR_PATH; echo

	echo "3-- CHECK DEIN INSTALLATION" &&
		if [ ! -d "$DEIN_CACHE_DIR" ]; then
			echo &&
				echo "[1.] DEIN-> MKDIR [$DEIN_CACHE_DIR]" 		&& 	mkdir -p $DEIN_CACHE_DIR &&
				echo "[2.] DEIN-> DWNLD INSTALLER" 				&& 	curl $DEIN_INSTALLER_URL > $DEIN_INSTALLER_PATH &&
				echo "[3.] DEIN-> RUN   INSTALLER" 				&& 	sh $DEIN_INSTALLER_PATH $DEIN_CACHE_DIR &&
				echo
		else echo "   :DEIN EXISTS SO NOT INSTALLING:"; fi; echo

	echo "4-- CHECK YOUCOMPLETEME BUNDLE INSTALLATION" &&
		if [ ! -d "$YCM_GIT_REQUEST_DIR" ]; then
			echo &&
				echo "[1.] YCM--> MKDIR [$VALLORIC_REPO_DIR]" 	&& 	(mkdir -p $VALLORIC_REPO_DIR || true) &&
				echo "[2.] YCM--> CLANG DEPENDENCY INSTALL"		&& 	(eval $YCM_DEPENDENCY_INSTALL_STRING || true) &&
				echo "[3.] YCM--> CLONE REPO TO DEIN DIR"		&& 	(git clone $YCM_GIT_URL $YCM_REPO_DIR || true) &&
				echo "[4.] YCM--> PUSHD 2 [$YCM_REPO_DIR]"		&& 	cd $YCM_REPO_DIR &&
				echo "[5.] YCM--> UPDATE SUBMODULES"			&& 	git submodule update --init --recursive &&
				echo "[6.] YCM--> INSTALL YCM"					&& 	./installer.py --clang-completer &&
				echo "[7.] YCM--> POPD 2 [$DOTFILES_ROOT_DIR]"	&& 	cd $DOTFILES_ROOT_DIR &&
				echo
		else echo "   :YOUCOMPLETEME EXISTS SO NOT INSTALLING:"; fi; echo


