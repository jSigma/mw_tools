#!/bin/bash
gsettings set org.gnome.desktop.interface gtk-theme "Cameo-Dark-Blue"
dconf write /org/gnome/shell/extensions/user-theme/name "'Cameo-Dark-Blue'"
gsettings set org.gnome.desktop.background picture-uri "$HOME/.mw_tools/Backgrounds/4.jpg"
gsettings set org.gnome.desktop.interface icon-theme "MW-Blue"
