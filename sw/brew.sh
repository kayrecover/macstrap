#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

# Agree to license
# xcodebuild -license
################################################################[ BREW ]########
sudo chown -R $USER: /usr/local || exit
brew_path=`which brew`
if [[ ! -f $brew_path ]]
then 
  echo "Installing Homebrew"
    successfully ruby <(curl -fsS https://raw.github.com/mxcl/homebrew/go)
fi

echo "Updating & Ugrading Homebrew..."
  successfully brew update
  successfully brew upgrade

echo "Installing homebrew-cask"
  successfully brew tap phinze/homebrew-cask
  successfully brew install brew-cask

echo "Install .app Casks in a detached screen (screen -r to see progress)"
  screen -d -m $SCRIPT_DIR/brew-cask.sh

APPS="automysqlbackup axel chruby curl dos2unix git heroku-toolbelt \
	grc lftp mysql ncftp nmap nzbget p7zip pidof ruby-build s3cmd \
	the_silver_searcher tmux tree unrar watch wget youtube-dl zsh"

echo "Installing CLI tools"
  for APP in $APPS
  do
      brew install  $APP
  done

echo "Cleaning up after brew"
  brew cleanup
