#!/bin/bash

# This script will
#   install zsh and zsh-completions via Homebrew
#   install Oh my Zsh + some plugins and powerlevel9k theme
#   symlink .zshrc

if type -p brew; then
    brew install zsh zsh-completions

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k
    git clone https://github.com/djui/alias-tips.git $HOME/.oh-my-zsh/custom/plugins/alias-tips
    git clone https://github.com/tomsquest/nvm-auto-use.zsh.git $HOME/.oh-my-zsh/custom/plugins/nvm-auto-use

    zshrc_path=$HOME/.zshrc

    if [ -f $zshrc_path ]; then
        mv $zshrc_path $HOME/.zshrc-old
    fi

    echo ""
    echo "execute: ln -s ~/.dotfiles/zsh/mac-os/.zshrc ~/.zshrc"
    echo ""
    echo 'execute: source ~/.zshrc'
else
    echo 'Please install Homebrew first'
fi