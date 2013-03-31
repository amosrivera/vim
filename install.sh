#!/bin/bash
git clone https://amosrivera@github.com/amosrivera/vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/

cd ~/.vim
git submodule init
git submodule update
