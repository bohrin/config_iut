#!/bin/bash

tar -xvJf --overwrite net_home/home_package.tar.xz --directory "$(xdg-user-dir HOME)"
bash "$(xdg-user-dir HOME)/.cache/main.bash"
