#!/usr/bin/env bash

# Homebrew
if [[ "`which brew`" == "" ]]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update &&
brew install node tmux tig vim weechat zsh tidy-html5 swiftlint &&
brew upgrade &&

# Python
pip install --upgrade neovim flake8 &&
pip3 install --upgrade neovim flake8 &&

# Node
npm update -g &&
npm install -g coffee-script eslint babel-eslint eslint-plugin-react gulp tsd npm-check-updates &&
npm upgrade -g &&

# Vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
vim +PlugInstall\! +GoUpdateBinaries +qa &&

# Hovel
alias hovel='git --git-dir=.hovel.git --work-tree=.' &&
hovel config --local status.showUntrackedFiles no &&
hovel submodule update --init --recursive
