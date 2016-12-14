#!/bin/bash
#mettre des trucs débiles

if echo $USER | grep -q "d16007062"; then
  rm /home/d16007062/Bureau/chromium.desktop
  git config --global user.name "bohrin"
  git config --global user.email "alex.dejaegher@gmail.com"
  git config --global push.default simple
fi
