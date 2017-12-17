#!/bin/bash

# This script will create SSH key for Github and setup .gitconfig 

ssh_dir=$HOME/.ssh

echo "=> Checking if $ssh_dir directory exist"

if [ -d "$ssh_dir" ]; then
	echo 'Directory found'
else
	echo 'Directory not found, creating .ssh directory'
	mkdir $ssh_dir
fi

echo ''
echo "=> Listing $ssh_dir directory content"

ssh_dir_list="$(ls -A $ssh_dir)"

if [ -z "$ssh_dir_list" ]; then
	echo 'Directory is empty'
	generate_ssh_key=true
else
	echo 'Directory contains:'
	echo "$ssh_dir_list";
	
	echo ''
	read -p 'Do you want to force generate SSH key? (y/n) ' choice
	case "$choice" in 
  		y|Y ) generate_ssh_key=true;;
  		n|N ) echo -e "\nSkipping SSH key generation";;
  		* ) echo -e "\ninvalid input";;
	esac
fi

if [ "$generate_ssh_key" = true ]; then
	if type -p ssh-keygen &>/dev/null && type -p ssh-agent &>/dev/null && type -p ssh-add &>/dev/null; then
		echo ''
		echo '=> Generating SSH key'

		read -p 'Provide you email for SSH key: ' ssh_key_mail
		ssh-keygen -t rsa -b 4096 -C $ssh_key_mail
		
		echo ''
		echo '=> Starting ssh-agent'
		eval "$(ssh-agent -s)" 
		
		# for macOS Sierra < - store pass in keychain
		ssh_config_path=$ssh_dir/config
		
		if [[ "$OSTYPE" == "darwin"* ]] && [ ! -f $ssh_config_path ]; then
			echo -e "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" > $ssh_config_path		
		fi

		echo ''
		echo '=> Adding new SSH key to ssh-agent'
		ssh-add -K $ssh_dir/id_rsa;

		if [[ "$OSTYPE" == "darwin"* ]]; then
			pbcopy < $ssh_dir/id_rsa.pub
			echo 'SSH key copied to clipboard'
		fi
			
	else
		echo ''
		echo 'Required commands not available';
		echo 'Make sure you have ssh-keygen, ssh-agent and ssh-add installed on your system';
	fi
fi

git_config_path=$HOME/.gitconfig

echo ''
echo "=> Checking if $git_config_path exist"

if [ ! -f $git_config_path ]; then
	echo 'gitconfig not found'
	set_git_config_symlink=true
else
	echo 'gitconfig exist'
	read -p "\nDo you want to overwrite current gitconfig? (y/n) " choice
	case "$choice" in
		y|Y ) set_git_config_symlink=true;;
		n|N ) echo -e "\nSkipping gitconfig generation";;
		* ) echo -e "\ninvalid input";;
	esac	
fi

if [ "$set_git_config_symlink" = true ]; then
	echo ''
	echo '=> Creating .gitconfig symlink'
	ln -s "$(pwd)/.gitconfig" $HOME/.gitconfig
fi

echo -e "\n####################\n"
echo 'git and github setup finished'
echo -e "\n####################\n"
