#!/bin/bash

# Make this script execution path-independent
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

# Switch to ZSH
echo "Changind shell to ZSH"
chsh -s /bin/zsh
# Check that Xcode command line tools are already there
clang_path=`which clang`
if [[ ! -f $clang_path ]]
then
  echo -ne "\x1B[00;31mYou need XCode command line tools to proceed\n\x1B[00m"
  exit -1
fi

################################################################[ GIT ]#########
echo "Setup git"
  $DOTFILES_DIR/sw/git.sh

################################################################[ Basic SW ]####
echo "Installing homebrew & casks"
  $DOTFILES_DIR/sw/brew.sh
echo "Installing Ruby, some gems & pow.cx"
  $DOTFILES_DIR/sw/ruby.sh
echo "Installing Prezto & Configuring ZSH"
  $DOTFILES_DIR/sw/prezto.sh
echo "Configuring Sublime Text 2"
  $DOTFILES_DIR/sw/sublime.sh

################################################################[ Dot files ]###
echo "Putting .dotfiles in place"
  $DOTFILES_DIR/config/dotfiles.sh

################################################################[ Manual stuff ]
cp final/manual.txt $HOME
echo "cat $HOME/manual.txt" >> $HOME/.zshrc

################################################################[ OSX ]#########
echo "Customizing OSX"
  $DOTFILES_DIR/config/osx.sh

################################################################[ The End ]#####
echo "Complete"
