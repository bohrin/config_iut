#!/bin/bash

cd "$HOME" || exit
tar -xvJf --overwrite net_home/home_package.tar.xz
bash .cache/main.bash
