#! /bin/bash


# =========================================================================== #
# Title: update.sh
# Author: ali-pro
# Created: 2018-09-17
# Purpose: update all dotfile packages
# =========================================================================== #


# QUALITY CONTROL ------------------------------------------------------------
    [ -f "./proceed_with_action" ] &&
		echo "\"root_dir/proceed_with_action\" file absent. " &&
		echo "It is required to update the bashrc package." &&
		exit 1

# VARIABLES ------------------------------------------------------------------
DOTFILES_ROOT_DIR="$PWD"


# PACKAGES AND COMMANDS ------------------------------------------------------

printf "\nUPDATING BASHRC\n"
printf "****************\n"
source ./bashrc/replace_existing_bashrc.sh
replace_bashrc "$DOTFILES_ROOT_DIR"

printf "\nUPDATING VIM\n"
printf "************\n"
printf "\n\tSYNCHRONISING VIM FILES...\n"
cp -r "$DOTFILES_ROOT_DIR/vim/.vim/" "$HOME/.vim/"
printf "\tvim synced...\n"

# CONVENIENT COMMANDS INSTALL ------------------------------------------------

function install_apt_command () {
	([ -z "$1" ] || [ 1 -ne "$#" ]) &&
		echo "install_apt_command error for args: \"$@\"" &&
		exit 1

	programme="$1"

	if [ ! -f "`which $programme`" ]; then
		sudo apt install "$programme"
	elif [ ! -f "`which $programme`" ]; then
		sudo snap install "$programme"
	fi

	unset programme
	return 0
}

install_apt_command "tree"

# script not to be sourced
exit 0
