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

# brew install wget

brew install neovim

brew install git

# brew install p7zip

brew install tmux

brew install the_silver_searcher

brew install ripgrep

# brew install ctags

# brew cask install gimp

brew install python@3.9

brew install node

npm install -g n pyright

/usr/local/bin/pip3 install --user virtualenv neovim autopep8 jedi pynvim

sudo chmod -R go-w /usr/local/share

brew cleanup
