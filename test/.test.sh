#! /bin/bash


# =========================================================================== #
# Title: .test.sh
# Author: ali-pro
# Created: 2018-09-18
# Purpose: test functions
# =========================================================================== #

# CONSTANTS ( for testing ) -------------------------------------------------
	TEST_DIR="./test/.test_dir"

	TARGET_FILE_PATH="$TEST_DIR/target_file"
	SOURCE_FILE_PATH="$TEST_DIR/source_file"

	TARGET_DIR_PATH="$TEST_DIR/target_DIR"
	SOURCE_DIR_PATH="$TEST_DIR/source_DIR"
	SOURCE_DIR_CONTENT_PATH="$SOURCE_DIR_PATH/source_content.file"

# SOURCE --------------------------------------------------------------------
	source ./.util_functions.sh
		# TESTED FUNCTIONS
		# ----------------
		# 	install_apt_command
		#	print_title
		#	sync_file
		#	sync_dir

echo
# TESTS -------------------------------------------------------------------
	echo "# install_apt_command -----------------------------------------------------"
	install_apt_command "tree"; echo


	echo "# print_title -------------------------------------------------------------"
	print_title "test title"; echo


	echo "# sync_file ---------------------------------------------------------------"
	echo "1-- CREATE source_file..."; 	touch $SOURCE_FILE_PATH;
	echo "2-- SHOW_DIR: [INITIAL].."; 	tree -a $TEST_DIR; echo;
	echo "3-- RUN:target_file absent"; 	sync_file $TARGET_FILE_PATH $SOURCE_FILE_PATH;echo;
	echo "4-- SHOW_DIR: [1st RUN].."; 	tree -a $TEST_DIR; echo;
	echo "5-- RUN:target_file exists:";	sync_file $TARGET_FILE_PATH $SOURCE_FILE_PATH;echo;
	echo "6-- SHOW_DIR: [2nd RUN].."; 	tree -a $TEST_DIR; echo;
	echo "7-- EMPTYING $TEST_DIR ..."; 	eval "rm -r $TEST_DIR/*"; echo;


	echo "# sync_dir ----------------------------------------------------------------"
	echo "1-- CREATE source_dir..."; 		mkdir $SOURCE_DIR_PATH;
	echo "2-- CREATE src_dir_content.."; 	touch $SOURCE_DIR_CONTENT_PATH; echo;
	echo "3-- SHOW_DIR: [INITIAL].."; 		tree -a $TEST_DIR; echo;
	echo "4-- sync_dir: target dir ABSENT"; sync_dir $TARGET_DIR_PATH $SOURCE_DIR_PATH; echo;
	echo "5-- SHOW_DIR: [1st RUN].."; 		tree -a $TEST_DIR; echo;
	echo "6-- CREATE EXTRA content.."; 		touch "$SOURCE_DIR_CONTENT_PATH""2"; echo;
	echo "5-- SHOW_DIR: [+XTRA CONTENT]"; 	tree -a $TEST_DIR; echo;
	echo "7-- sync_dir: target dir EXISTS"; sync_dir $TARGET_DIR_PATH $SOURCE_DIR_PATH; echo;
	echo "8-- SHOW_DIR: [2nd RUN].."; 		tree -a $TEST_DIR; echo;
	echo "9-- EMPTYING $TEST_DIR ..."; 		eval "rm -r $TEST_DIR/*"; echo;
	echo "10- SHOW_DIR: [EMPTY DIR].."; 	tree -a $TEST_DIR; echo;



exit 0
