#!/bin/bash

if type -p brew &>/dev/null; then
    brew tap caskroom/cask;
    brew tap caskroom/fonts;

    brew install cask;

    apps=(
        arduino
        caffeine
        dropbox
        firefox
        font-mononoki-nerd-font
        google-chrome
        istat-menus
        iterm2
        java
        slack
        spotify
        studio-3t
        virtualbox
        vlc
        webstorm
    )

    brew cask install "${apps[@]}"
else
    echo 'Install Homebrew first!'
fi
