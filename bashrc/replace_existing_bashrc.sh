#! /bin/bash


# ==========================================================================
# Title: replace_existing_bashrc.sh
# Author: ali-pro
# Created: 2018-09-17
# Purpose: to replace .bashrc file with that held in this repo
# ==========================================================================

function replace_bashrc () {
    # QUALITY CHECKING -----------------------------------------------------
	printf "\nFUNCTION: ./bashrc/replace_existing_bashrc.replace_bashrc()\n"
    printf "\n\tARGS_QUALITY_CHECK...\n"

	[ -z "$1" ] && echo "ROOT_DIR ARG LEN == 0 " && exit 1

	[ "$#" -ne 1 ]  &&
		echo "ARG_COUNG != 1 FOR replace_existing_bashrc.replace_bashrc()" &&
		exit 1

    [ -f "./halt_action" ] &&
		echo "\"root_dir/halt_action\" file absent. " &&
		echo "It is required to update the bashrc package." &&
		exit 1

	# VARIABLES --------------------------------------------------------
	printf "\n\tVARIABLE_PREPARATION:\n"
	root_dir="$1"
	repo_bashrc_path="$root_dir/bashrc/.bashrc"
	bashrc_path="$HOME/.bashrc"
	bashrc_path_bkp="$HOME/.bashrc.bkp"

	printf "\t    + root_dir         = $root_dir\n"
	printf "\t    + repo_bashrc_path = $repo_bashrc_path\n"
	printf "\t    + bashrc_path      = $bashrc_path\n"
	printf "\t    + bashrc_path_bkp  = $bashrc_path_bkp\n"


	# FILE MANIPULATION ------------------------------------------------
	printf "\n\tFILE_MANIPULATION:\n"
	if [ -f $bashrc_path ]
	then
		printf "\t    + .bashrc exists so backing up then copying...\n"
		cp "$bashrc_path" "$bashrc_path_bkp"
		cp "$repo_bashrc_path" "$bashrc_path"
	else
		printf "\t    + .bashrc NON-EXITENT so copying only...\n"
		cp "$repo_bashrc_path" "$bashrc_path"

	fi
	printf "\n\tSOURCING_BASHRC...\n"
	source ~/.bashrc

	# DECLUTTERING VARIABLES -------------------------------------------
	printf "\n\tDECLUTTERING_VARIABLES...\n"
	unset root_dir
	unset bashrc_path
	unset bashrc_path_bkp
	unset repo_bashrc_path

	printf "\n\tPACKAGE_UPDATED: bashrc\n"

    return 0
}
