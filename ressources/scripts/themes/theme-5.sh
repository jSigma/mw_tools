#!/bin/bash
gsettings set org.gnome.desktop.interface gtk-theme "Cameo-OSX"
dconf write /org/gnome/shell/extensions/user-theme/name "'Cameo-OSX'"
gsettings set org.gnome.desktop.background picture-uri "$HOME/.mw_tools/Backgrounds/5.jpg"
gsettings set org.gnome.desktop.interface icon-theme "MW-Blue"
