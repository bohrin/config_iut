#!/bin/bash
#mettre des trucs débiles

if echo "$USER" | grep -q "d16007062"; then
  rm /home/d16007062/Bureau/chromium.desktop
  git config --global user.name "bohrin"
  git config --global user.email "alex.dejaegher@gmail.com"
  git config --global push.default simple
fi

if echo "$USER" | grep -q "e16006130"; then
  bash "$HOME/net-home/start_git.bash"
  git clone https://github.com/L0L022/sem1_iut "$HOME/Bureau/sem1_iut"
  git clone https://github.com/L0L022/projet_bash "$HOME/Bureau/projet_bash"
fi
