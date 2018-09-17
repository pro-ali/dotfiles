#! /bin/bash


# =========================================================================== #
# Title: update.sh
# Author: ali-pro
# Created: 2018-09-17
# Purpose: update all dotfile packages
# =========================================================================== #



# VARIABLES ------------------------------------------------------------------
DOTFILES_ROOT_DIR="$PWD"


# PACKAGES AND COMMANDS ------------------------------------------------------
echo
echo "UPDATING BASHRC"
echo "---------------"
source ./bashrc/replace_existing_bashrc.sh
replace_bashrc "$DOTFILES_ROOT_DIR"


# script not to be sourced
exit 0
