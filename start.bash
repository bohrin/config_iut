#!/bin/bash

cd "$HOME"
tar -xvJf --overwrite net_home/home_package.tar.xz
bash .cache/main.bash
