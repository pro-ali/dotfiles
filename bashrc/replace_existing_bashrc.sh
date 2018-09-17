#! /bin/bash


# =========================================================================== #
# Title: replace_existing_bashrc.sh
# Author: ali-pro
# Created: 2018-09-17
# Purpose: to replace .bashrc file with that held in this repo
# =========================================================================== #

function replace_bashrc () {
	if [ -f "./halt_action" ]
	then
		echo
		echo "WILL NOT ALTER LOCAL .BASHRC FILES ..."
	else
		echo
		echo "function: replace_bashrc()..."
		echo "# > variables"
		bashrc_path="$HOME/.bashrc"
		bashrc_path_bkp="$HOME/.bashrc.bkp"
		repo_bashrc_path="`pwd`/.bashrc"

		echo "# > replacement and backup .bashrc..."
		mv $bashrc_path $bashrc_path_bkp
		cp $repo_bashrc_path $bashrc_path

		echo "# > de-clutter variables..."
		unset bashrc_path
		unset bashrc_path_bkp
		unset repo_bashrc_path
	fi

	return 0
}
