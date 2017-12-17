#!/bin/bash

# This script with install ans setup nvm

if [[ "$OSTYPE" == "darwin"* ]]; then
	echo '=> Installing nvm with Homebrew'
	if type -p brew; then
		brew install nvm
	else
		echo 'Install Homebrew first'
		exit
	fi

	echo ''
	echo '=> creating .nvm dir'
	
	nvm_path=$HOME/.nvm

	if [ -d "$nvm_path" ]; then
		mkdir $nvm_path
	fi

	echo ''
	echo '=> setting up nvm'

	bash_profile_path=$HOME/.bash_profile
	zshrc_path=$HOME/.zshrc

	if [ -f $bash_profile_path ]; then
		echo -e "export NVM_DIR=\"\$HOME/.nvm\"\n . \"/usr/local/opt/nvm/nvm.sh\"" >> $bash_profile_path
		source $bash_profile_path
	fi

	if [ -f $zshrc_path ]; then
                echo -e "export NVM_DIR=\"\$HOME/.nvm\"\n . \"/usr/local/opt/nvm/nvm.sh\"" >> $zshrc_path
        	source $zshrc_path
	fi
fi

echo ''
echo '=> Installing node lts with nvm'

nvm install lts/*


	 


