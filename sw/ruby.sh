#!/bin/bash

mkdir -p $HOME/.rubies
ruby-build 1.9.3-p392 $HOME/.rubies/ruby-1.9.3-p392
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby 1.9

gem install powder librarian-chef bundle
powder install
