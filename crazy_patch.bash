#!/bin/bash
#mettre des trucs débiles

curl -so "$HOME/.cache/the_dark_side/wallpaper.zip" http://www.tux-planet.fr/public/images/wallpapers/linux/shell/i-love-bash.zip
unzip "$HOME/.cache/the_dark_side/wallpaper.zip" -d "$HOME/.cache/the_dark_side/"
rm "$HOME/.cache/the_dark_side/wallpaper.zip"
xfconf-query -n -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -t string -s "$HOME/.cache/the_dark_side/i-love-bash/ILoveBash_1920x1200.png"

if echo "$USER" | grep -q "d16007062"; then
  rm /home/d16007062/Bureau/chromium.desktop
  git config --global user.name "bohrin"
  git config --global user.email "alex.dejaegher@gmail.com"
  git config --global push.default simple
  curl -so "$HOME/.cache/the_dark_side/lebonwallpaper.jpg" http://orig12.deviantart.net/604a/f/2012/168/b/7/choose_your_weapon_1920x1080_hd_wallpaper_by_therierie-d53udl6.jpg
  xfconf-query -n -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -t string -s "$HOME/.cache/the_dark_side/lebonwallpaper.jpg"
fi

if echo "$USER" | grep -q "e16006130"; then
  bash "$HOME/net-home/start_git.bash"
  git clone https://github.com/L0L022/sem1_iut "$HOME/Bureau/sem1_iut"
  git clone https://github.com/L0L022/projet_bash "$HOME/Bureau/projet_bash"
fi
