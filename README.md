# .dotfiles
This repository contains dotfiles and installation scripts for setting up new installed macOS and Arch Linux.

macOS scripts supports installing brew, cask and cask-fonts with set of apps and binaries. Setting up zsh, nvm,
iTerm2 preferences, vim config, gitconfig and Github SSH key.

Arch Linux version is still in progress.

## Setup macOS
1. clone repo to `$HOME/.dotfiles` directory
2. run `.dotfiles/brew/setup-brew.sh` - to install Homebrew together with some brew packages 
3. run `.dotfiles/brew/setup-cask.sh` - to install brew cask and cas fonts together with some apps and terminal fonts
4. run `.dotfiles/nvm/setup-nvm.sh` - to install NVM and recent node.js LTS version
5. run `.dotfiles/zsh/setup-zsh.sh` - to install oh my ZSH and Powerlevel9k theme and some plugins
6. `ln -s .dotfiles/zsh/mac-os/.zshrc .zshrc` create symlink for ZSH shell config
7. run `source .zshrc`
8. run `.dotfiles/git/setup-github.sh` - to setup gitconfig and create Github SSH key
9. run `.dotfiles/iterm/setup-iterm.sh` - to setup iTerm2 preferences
10. `ln -s .dotfiles/vim/.vimrc .vimrc` -create a symlink for vim configuration

## Setup Arch Linux
_TBD_
