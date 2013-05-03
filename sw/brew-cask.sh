#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

APPS="dropbox firefox google-chrome mplayerx \
      namemangler sublime-text thunderbird vlc iterm2 \
      quicksilver sequel-pro libre-office lime-chat \
      jumpcut x-quartz vagrant virtualbox adium skype \
      airfoil calibre deluge-torrent jiggler kindle mailacton \
      netnewswire sequentialx spamsieve tofu tor-browser"

successfully mkdir -p /usr/local/Library/Taps/my-casks/
successfully ln -s $SCRIPT_DIR/Casks /usr/local/Library/Taps/my-casks/Casks

for APP in $APPS
do
    brew cask install $APP
done

echo "Destroying symlinks and moving across real applications"
for app in ~/Applications/*.app
do
  if [ -L "$app" ]; then
  	REALAPP=`readlink "$app"`
  	DEPTH=`echo "$REALAPP" | grep -o "app" | wc -l`
  	rm "$app"
  	if [ $DEPTH == 1 ]; then
  	  mv "$REALAPP" ~/Applications
  	fi
  fi
done

echo "Copying across PKG installer files"
mkdir -p $HOME/PKG
find /opt/homebrew-cask/Caskroom -type f -name '*.pkg' -exec cp {} $HOME/PKG \;
open $HOME/PKG

for APP in $APPS
do
    brew cask uninstall $APP
done
# Get rid of the symlink
rm /usr/local/Library/Taps/my-casks/Casks
rmdir /usr/local/Library/Taps/my-casks

# Add subl to the CLI
ln -s ~/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Setup iTerm2
echo "Importing Base16 iTerm2 color scheme"
curl https://raw.github.com/chriskempson/base16-iterm2/master/base16-monokai.dark.256.itermcolors > ~/base16-monokai.dark.256.itermcolors
# Found a race condition - give iTerm a second or so to start up for the first time
open "$HOME/Applications/iTerm.app" && sleep 2 && open "$HOME/base16-monokai.dark.256.itermcolors"

