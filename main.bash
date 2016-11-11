#!/bin/bash

THEME="Arc-Dark"

xfconf-query -n -c xsettings -p /Net/ThemeName -t string -s "$THEME"
xfconf-query -n -c xsettings -p /Net/IconThemeName -t string -s Arc

xfconf-query -n -c xfwm4 -p /general/theme -t string -s "$THEME"
xfconf-query -n -c xfwm4 -p /general/use_compositing -t bool -s true
xfconf-query -n -c xfwm4 -p /general/show_frame_shadow -t bool -s true
xfconf-query -n -c xfwm4 -p /general/show_popup_shadow -t bool -s true
xfconf-query -n -c xfwm4 -p /general/workspace_count -t int -s 2

xfconf-query -n -c keyboards -p /Default/Numlock -t bool -s true

xfconf-query -n -c xfce4-panel -p /panels/panel-1/nrows -t int -s 2
xfconf-query -n -c xfce4-panel -p /panels/panel-2/autohide -t bool -s true
xfconf-query -n -c xfce4-panel -p /plugins/plugin-1/show-button-title -t bool -s false
xfconf-query -n -c xfce4-panel -p /plugins/plugin-1/button-icon -t string -s debian-logo
xfconf-query -n -c xfce4-panel -p /plugins/plugin-4/rows -t int -s 2

xdg-mime default Thunar.desktop inode/directory
xdg-mime default mousepad.desktop text text/css text/csv text/html text/plain text/xml text/x-h text/x-c
xdg-mime default ristretto.desktop image image/gif image/jpeg image/png image/tiff

xdg-user-dirs-update
cp /usr/share/applications/firefox-esr.desktop "$(xdg-user-dir DESKTOP)"
chmod u+x "$(xdg-user-dir DESKTOP)/firefox-esr.desktop"
sed -i "s|~|$(xdg-user-dir HOME)|g" "$(xdg-user-dir HOME)/.cache/atom/atom.desktop"
cp "$(xdg-user-dir HOME)/.cache/atom/atom.desktop" "$(xdg-user-dir DESKTOP)"
chmod u+x "$(xdg-user-dir DESKTOP)/atom.desktop"

#if file exist
#sed -i 's/\(FileManager=\).*/\1Thunar/' $HOME/.config/xfce4/helpers.rc
#sed -i 's/\(TerminalEmulator=\).*/\1xfce4-terminal/' $HOME/.config/xfce4/helpers.rc
#sed -i 's/\(WebBrowser=\).*/\1firefox/' $HOME/.config/xfce4/helpers.rc
