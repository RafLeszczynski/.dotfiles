# .dotfiles
This repository contains dotfiles and installation scripts for setting up new installed macOS and Arch Linux.

macOS scripts supports installing brew, cask and cask-fonts with set of apps and binaries. Setting up zsh, nvm,
iTerm2 preferences, gitconfig and Github SSH key.

Arch Linux version si still in progress.

## Setup macOS
1. clone repo to `$HOME/.dotfiles` directory
2. run `.dotfiles/brew/setup-brew.sh`
3. run `.dotfiles/brew/setup-cask.sh`
4. run `.dotfiles/nvm/setup-nvm.sh`
5. run `.dotfiles/zsh/setup-zsh.sh`
6. create symlink for `.zshrc`
7. run `source .zshrc`
8. run `.dotfiles/git/setup-github.sh`
9. run `.dotfiles/iterm/setup-iterm.sh`

## Setup Arch Linux
_TBD_
