#!/bin/bash

# check prerequisites
command -v git >/dev/null 2>&1 || { echo >&2 "git is not installed.  Aborting."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "curl is not installed.  Aborting."; exit 1; }


# destructive setup
rm -f $HOME/.vimrc
rm -rf $HOME/.vim

ln -s $PWD/../.vimrc $HOME/.vimrc

# create directories for pathogen and pathogen bundles
echo "Creating directories..."
mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/autoload
echo "Done creating directories"

# get pathogen
echo "Retrieving pathogen via curl"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Done retrieving pathogen"

# NERDtree
echo "Retrieving bundle NERDtree"
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree
echo "Done retrieving NERDtree"

# run Helptags
echo "Running Helptags"
vim -c ":Helptags" -c ":q" >&/dev/null
echo "Done running Helptags"

echo "vim setup complete!"
