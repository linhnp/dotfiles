#!/bin/bash

sudo -v

echo "! Install Developer Tools"
xcode-select --install

# check if brew is installed
which -s brew
if [[ $? != 0 ]] ; then
	# Install Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew upgrade

brew install --cask iterm2 keepassxc

brew install zsh-completions

brew install neovim

brew install git

brew install tmux

brew install ripgrep

brew install python

brew install node

/usr/local/bin/pip3 install --user virtualenv

sudo chmod -R go-w /usr/local/share

npm install -g n

sudo mkdir -p /usr/local/n

sudo chown -R $(whoami) /usr/local/n

n lts

npm install -g eslint

brew cleanup
