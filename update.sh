#! /bin/bash


# =========================================================================== #
# Title: update.sh
# Author: ali-pro
# Created: 2018-09-17
# Purpose: update all dotfile packages
# =========================================================================== #

echo
echo "UPDATING BASHRC"
echo "---------------"
source ./bashrc/replace_existing_bashrc.sh
replace_bashrc


# script not to be sourced
exit 0
