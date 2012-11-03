#!/bin/bash

set_git_global_config() {
	if [ "$1" ]; then
		echo "Setting $1 to be [$2]"
		git config --global "$1" "$2"
	fi
}

query_git_config_variable () {
	EXISTING_VALUE=`git config --global $1`

	echo "Enter $2 [$EXISTING_VALUE]:"
	read -e NEW_VALUE

	if [ "$NEW_VALUE" ]; then
		set_git_global_config "$1" "$NEW_VALUE"
	fi
}

if [ -f ~/.gitconfig ]; then
	echo "~/.gitconfig already exists - not replacing"
else
	echo "Starting with a default git configuration file"
    cp gitconfig ~/.gitconfig
fi

query_git_config_variable "user.name" "you name"
query_git_config_variable "user.email" "you email address"
set_git_global_config "core.excludesfile" "~/.gitignore.global"

if [ -f ~/.gitignore.global ]; then
	cp gitignore ~/.gitignore.global
fi


