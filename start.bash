#!/bin/bash

tar --xz --extract --file home_package.tar.xz --directory "$(xdg-user-dir HOME)"
bash "$(xdg-user-dir HOME)/.cache/main.bash"

