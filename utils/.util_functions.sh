#! /bin/bash


# =========================================================================== #
# Title: .util_functions.sh
# Author: ali-pro
# Created: 2018-09-18
# Purpose: functions to be used in update.sh
# =========================================================================== #

# FUNCTIONS_IN_SCRIPT
# -------------------
#	check_argument_count
#	check_dir_exists
#	check_file_exists
#	install_apt_command
#	print_line
#	print_title
#	replace_bashrc
#	sync_dir
#	sync_file

# ATOMIC TOOLS -------------------------------------------------------------

function check_argument_count () {
    argument_count="$1"
    required_count="$2"
    func_name="$3"
    [ "$argument_count" -ne "$required_count" ] &&
        echo &&
        echo "ERROR CHECK_ARGUMENT_COUNT: $func_name"  &&
        echo "    - argument count = $argument_count"  &&
        echo "    - required count = $required_count"  &&
        exit 1
    return 0
}


function check_file_exists () {
    file_path="$1"
    func_name="$2"
    [ ! -f "$file_path" ] &&
        echo &&
        echo "ERROR CHECK_FILE_EXISTS: $func_name"  &&
        echo "     - file_path given = $argument_count"  &&
        exit 1
    return 0
}


function check_dir_exists () {
    dir_path="$1"
    func_name="$2"
    [ ! -d "$dir_path" ] &&
        echo &&
        echo "ERROR CHECK_DIR_EXISTS: $func_name"  &&
        echo "     -  func doing check = $func_name"  &&
        echo "     - dir being checked = $dir_path"  &&
        echo "     -    dir_path given = $argument_count"  &&
        exit 1
    return 0
}


function sync_file () {

	# Args:
	# -----
	#	1. target_file_path
	#	2. source_file_path
	# Return: 0

	echo
	echo "FUNCTION: $FUNCNAME"
    # VARIABLES -------------------------------------------------------------
    argument_count="$#"
    required_count="2"
    func_name="$FUNCNAME"
    target_file_path="$1"  # file to be updated
    source_file_path="$2"  # file used for updating
    target_file_path_backup="$target_file_path"".bkp"

    # ARGS INTEGRITY CHECK --------------------------------------------------
    check_argument_count $argument_count $required_count $func_name
    check_file_exists $source_file_path $func_name

    if [ -f "$target_file_path" ]; then
        echo "      BACKING_UP: $target_file_path ..."
        echo "              TO: $target_file_path_backup ..."
        cp $target_file_path $target_file_path_backup
    fi

	echo
    echo "    SYNCING_FILE: $source_file_path ..."
    echo "              TO: $target_file_path ..."
    cp $source_file_path $target_file_path

    #unset argument_count required_count func_name
    #unset target_file_path target_file_path_backup source_file_path
    return 0
}

function sync_dir () {

	# Args:
	# -----
	#	1. target_dir_path
	#	2. source_dir_path
	# Return: 0

	echo
	echo "FUNCTION: $FUNCNAME"
    # VARIABLES -------------------------------------------------------------
    argument_count="$#"
    required_count="2"
    func_name="$FUNCNAME"
    target_dir_path="$1"  # dir to be updated
    source_dir_path="$2"  # dir used for updating
    target_dir_path_backup="$target_dir_path"".bkp"

    # ARGS INTEGRITY CHECK --------------------------------------------------
    check_argument_count $argument_count $required_count $func_name
    check_dir_exists $source_dir_path $func_name

    if [ -f "$target_dir_path" ]; then
        echo "      BACKING_UP: $target_dir_path ..."
        echo "              TO: $target_dir_path_backup ..."
		[ -d "$target_dir_path_backup" ] && rm -r $target_dir_path_backup
        cp -r $target_dir_path $target_dir_path_backup
    fi

	echo
    echo "     SYNCING_DIR: $source_dir_path ..."
    echo "              TO: $target_dir_path ..."
	[ -d "$target_dir_path" ] && rm -r $target_dir_path
    cp -r $source_dir_path $target_dir_path

    #unset argument_count required_count func_name
    #unset target_dir_path target_dir_path_backup source_dir_path
    return 0
}

function print_line () {
	# VARIALES
	LIMIT=$1
	symbol=$2
	increment=1

	# DEFAULT VALUES
	LIMIT=${LIMIT:-10}
	symbol=${symbol:-*}

	while [ "$increment" -le "$LIMIT" ]; do
		printf "$symbol"
		let "increment+=1"
	done
}


function print_title () {
	check_argument_count $# 1 $FUNCNAME
	title=$1
	title_length=${#title}
	title_line=`print_line $title_length`
	echo "$title"
	echo "$title_line"
	return 0
}


# BASHRC FUNCTIONS ----------------------------------------------------------

    # REPLACE .bashrc FILE --------------------------------------------------
    function replace_bashrc () {
        # QUALITY CHECKING --------------------------------------------------
        printf "\nFUNCTION: ./bashrc/replace_existing_bashrc.replace_bashrc()\n"
        printf "\n\tARGS_QUALITY_CHECK...\n"

        [ -z "$1" ] && echo "ROOT_DIR ARG LEN == 0 " && exit 1

        [ "$#" -ne 1 ]  &&
            echo "ARG_COUNT != 1 FOR replace_existing_bashrc.replace_bashrc()" &&
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
        #unset root_dir
        #unset bashrc_path
        #unset bashrc_path_bkp
        #unset repo_bashrc_path

        printf "\n\tPACKAGE_UPDATED: bashrc\n"

        return 0
    }

# INSTALL NON-INSTALLED PROGRAMMES ------------------------------------------

    # FUNCTION --------------------------------------------------------------
    function install_apt_command () {
        ([ -z "$1" ] || [ 1 -ne "$#" ]) &&
            echo "install_apt_command error for args: \"$@\"" &&
            exit 1

        programme="$1"

        if [ ! -f "`which $programme`" ]; then
            sudo apt install "$programme"
			echo "Installed $programme with sudo apt"
		fi

		if [ ! -f "`which $programme`" ]; then
			sudo snap install "$programme"
			echo "Installed $programme with sudo snap"
		fi

		if [ -f "`which $programme`" ]; then
			echo "\"$programme\" exists so not installing"
		else
			echo "\"$programme\" DOES NOT EXISTS AND WAS UNABLE TO INSTALL"
			exit 1
        fi

        #unset programme
        return 0
    }

