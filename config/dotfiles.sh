#!/bin/zsh

for rcfile in dotfiles/*
do
  cp -vr "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

