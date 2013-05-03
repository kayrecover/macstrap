#!/bin/bash

export SUBLIME_PATH="$HOME/Library/Application Support/Sublime Text 2/Packages"
mkdir -p "$SUBLIME_PATH/User"
git clone https://github.com/wbond/sublime_package_control.git "$SUBLIME_PATH/Package Control"
git clone https://github.com/jisaacks/GitGutter.git "$SUBLIME_PATH/GitGutter"
git clone https://github.com/buymeasoda/soda-theme.git "$SUBLIME_PATH/Theme - Soda"
git clone https://github.com/chriskempson/base16-textmate.git "$SUBLIME_PATH/Base16 Color Schemes"

cp -vr sublime/* "$SUBLIME_PATH/User"
