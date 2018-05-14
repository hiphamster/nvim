#!/bin/zsh

# vunle plugin manager
test -d ~/.vim/bundle || \
  git clone https://github.com/VundleVim/Vundle.vim.git \
  ~/.vim/bundle/Vundle.vim
