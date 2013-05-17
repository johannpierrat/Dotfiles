#! /bin/zsh

## Warning: this script assumes that you are using zsh and running it from
## its directory (ie : ./install.zsh)
## This is a quick and dirty script, don't expect anything fancy from it


# Set options related to globbing, for the last line
setopt extendedglob
setopt glob_dots

# Synchronize the git submodules
files=$(grep 'path' .gitmodules | sed 's/^\s*path = //')
for file in $files; do
    mkdir -p $file
done
git submodule init
git submodule update

# Create symlinks
#cd $HOME
#ln -f -s $OLDPWD/*~*.git~*.gitmodules~*install.zsh~*README.markdown .