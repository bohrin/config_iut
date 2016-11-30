#!/bin/bash

tar --xz --extract --file home_package.tar.xz --directory "$HOME"
bash "$HOME/.cache/main.bash"
