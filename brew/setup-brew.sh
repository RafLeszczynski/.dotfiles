#!/bin/bash

# This script will install Homebrew and all packages from the list below.

if type -p brew &>/dev/null; then
	echo 'Homebrew is already installed'
else
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if type -p brew &>/dev/null; then
	apps=(
		mongodb
		docker
		awscli
		heroku
	)

	 brew install "${apps[@]}"
else
	echo 'brew command does not exist!'
fi
