#! /bin/bash


# ==========================================================================
# Title: replace_existing_bashrc.sh
# Author: ali-pro
# Created: 2018-09-17
# Purpose: to replace .bashrc file with that held in this repo
# ==========================================================================

function replace_bashrc () {
    # QUALITY CHECKING -----------------------------------------------------
    echo "checking if good argument (root_dir) given..."
    if ([ -z "$1" ] && [ 1 != "$#" ])
    then
        echo
        echo "argument given = \"$1\""
		return 1
    else
        root_dir=$1
    fi


    if [ -f "./halt_action" ]
    then
        echo
        echo "WILL NOT ALTER LOCAL .BASHRC FILES ..."

    # MAIN PART ------------------------------------------------------------
        # VARIABLES --------------------------------------------------------
        echo "function: replace_bashrc()..."
        echo "# > variables"
        bashrc_path="$HOME/.bashrc"
        bashrc_path_bkp="$HOME/.bashrc.bkp"
        repo_bashrc_path="$root_dir/bashrc/.bashrc"

        # FILE MANIPULATION ------------------------------------------------
        echo "# > replacement and backup .bashrc..."
        if [ -f $bashrc_path ]
        then
            echo "# >>> .bashrc exists so backing up then copying..."
            cp "$bashrc_path" "$bashrc_path_bkp"
            cp "$repo_bashrc_path" "$bashrc_path"
        else
            echo "# >>> .bashrc NON-EXITENT so copying only..."
            cp "$repo_bashrc_path" "$bashrc_path"

        fi

        # DECLUTTERING VARIABLES -------------------------------------------
        echo "# > de-clutter variables..."
        unset bashrc_path
        unset bashrc_path_bkp
        unset repo_bashrc_path
    fi

    return 0
}
