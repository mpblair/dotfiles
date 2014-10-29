#!/bin/bash

# check prerequisites
command -v git >/dev/null 2>&1 || { echo >&2 "git is not installed.  Aborting."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "curl is not installed.  Aborting."; exit 1; }


# destructive setup
rm -f $HOME/.vimrc
rm -rf $HOME/.vim

ln -s $PWD/.vimrc $HOME/.vimrc

# create directories for pathogen and pathogen bundles
mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/autoload

# get pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# NERDtree
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree
