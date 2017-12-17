#!/bin/bash

if type -p brew &>/dev/null; then
	brew tap caskroom/cask;
	brew tap caskroom/fonts;
	
	brew install cask;

	apps=(
                slack
                google-chrome
                firefox
                iterm2
                vlc
                webstorm
                dropbox
                studio-3t
                java
                arduino
                spotify
		font-hack-nerd-font
        )

        brew cask install "${apps[@]}"
else
	echo 'Install Homebrew first!'
fi
