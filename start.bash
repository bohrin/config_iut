#!/bin/bash

tar -xvJf --overwrite home_package.tar.xz --directory "$(xdg-user-dir HOME)"
bash "$(xdg-user-dir HOME)/.cache/main.bash"

