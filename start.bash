#!/bin/bash

package="home_package.tar.xz"

if [ -f "$package" ]; then
  tar --xz --extract --file "$package" --directory "$HOME"
else
  last_release="$(git ls-remote --tags "https://github.com/L0L022/config_iut" | sed "s|.*refs/tags/\(.*\)$|\1|g" | sort -V | tail -n 1)"
  if [ "$last_release" ]; then
    echo "$last_release"
    curl -o "$HOME/.cache/$package" https://github.com/L0L022/config_iut/releases/download/"$last_release"/"$package"
    tar --xz --extract --file "$HOME/.cache/$package" --directory "$HOME"
  else
    echo "release not found at https://github.com/L0L022/config_iut"
  fi
fi

date >> "$HOME/.cache/main.bash.log"
bash "$HOME/.cache/main.bash" >> "$HOME/.cache/main.bash.log"
