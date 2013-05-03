macstrap
========

This a tweaked repo to allow me to rebuild the bulk of my OSX development 
environment in record time.  Anything that can be automated, should be 
automated.

Introduction
============
This is a shameless rip-off of [fBootstrap](https://github.com/fbeeper/fBootstrap)
by [Ferran Poveda](https://github.com/fbeeper) and then modified to suit my own
purposes.  As such it also shares elements from [Thoughtbot's Laptop](https://github.com/thoughtbot/laptop)
and [Mathias Bynens](https://github.com/mathiasbynens/)' [OSX customizations](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)

Installation
============
    git clone git://github.com/kayrecover/macstrap.git ~/.macstrap 
    cd ~/.macstrap && ./bootstrap.sh

Scripts
=======
* [Git](http://git-scm.com/‎) setup stolen directly from [fBootstrap](https://github.com/fbeeper/fBootstrap)
* [Homebrew](http://mxcl.github.com/homebrew/)
* [Homebrew-Cask](https://github.com/phinze/homebrew-cask) with a collection of custom Casks
* [Ruby](http://www.ruby-lang.org/‎) installed via [ruby-build](https://github.com/sstephenson/ruby-build) and handled by [chruby](https://github.com/postmodern/chruby)
* [Pow](http://pow.cx/) and the [Powder](https://github.com/Rodreegez/powder‎) gem
* [Zsh](http://www.zsh.org/) and [Prezto](https://github.com/sorin-ionescu/prezto) with quite a few of my own custom aliases
* [Sublime Text](http://www.sublimetext.com/‎) with Package Control, GitGutter, Soda Theme, Base 16 color scheme & my own custom preferences
* [OSX](https://github.com/mathiasbynens/dotfiles/blob/master/.osx) customizations based upon and [Mathias Bynens](https://github.com/mathiasbynens/)' work

Homebrew Cask
=============
[Homebrew-Cask](https://github.com/phinze/homebrew-cask) is an awesome
extension to [Homebrew](http://mxcl.github.com/homebrew/) that allows you to 
install .app's to your ~/Applications directory from the CLI.

    brew cask install dropbox

There are quite a few hacks taking place here.  I have three issues with
homebrew-cask

1. I don't want symlinks in my ~/Applications - I want the full app itself.
2. It make symlinks to **all** the .apps it finds in the install path - this includes little .apps that are self-contained within .apps (crashreporter.app & plugincontainer.app & updater.app in Firefox.app for example)
3. It doesn't know what to do with PKG's.

To solve these, sw/brew-cask.sh does the following:

1. All the .apps symlinks are scanned for their "app depth"
2. The .app symlink is deleted and if the app depth is 1 it will then move the symlink target to ~/Applications
3. A recursive copy of all PKG's that have been downloaded are placed into ~/PKG

The following apps are installed and a handful of these are custom Casks that
aren't in the homebrew-cask repository.
* [Adium](http://adium.im/‎)
* [Airfoil](http://www.rogueamoeba.com/airfoil/‎)
* [Calibre](http://calibre-ebook.com/‎)
* [Deluge Torrent](http://deluge-torrent.org/‎)
* [Dropbox](http://www.dropbox.com)
* [Firefox](http://www.mozilla.org/en-US/firefox/new/‎)
* [Google Chrome](http://www.google.com/chrome/‎)
* [iTerm2](http://www.iterm2.com‎/)
* [LibreOffice](http://www.libreoffice.org)
* [LimeChat](http://limechat.net/mac/‎)
* [Jiggler](http://www.sticksoftware.com/software/Jiggler.html‎)
* [Jumpcut](http://jumpcut.sourceforge.net/‎)
* [Kindle for Mac](http://www.amazon.com/kindle)
* [MailActOn](http://www.indev.ca/MailActOn.html‎)
* [MplayerX](http://mplayerx.org/‎)
* [NameMangler](http://manytricks.com/namemangler/‎)
* [NetNewsWire](http://netnewswireapp.com/‎)
* [Quicksilver](http://qsapp.com/)
* [Sequel Pro](http://www.sequelpro.com/)
* [Sequential 2](http://sequentialx.com)
* [Skype](http://www.skype.com/‎)
* [SpamSieve](http://c-command.com/spamsieve/‎)
* [Tofu](http://amarsagoo.info/tofu/‎)
* [Tor Browser](https://www.torproject.org/projects/torbrowser.html.en‎)
* [Sublime Text](http://www.sublimetext.com/‎)
* [Thunderbird](https://www.mozilla.org/en-US/thunderbird/‎)
* [Vagrant](http://www.vagrantup.com/‎)
* [Virtualbox](https://www.virtualbox.org/‎)
* [VLC](http://www.videolan.org/)
* [XQuartz](http://xquartz.macosforge.org/‎)

