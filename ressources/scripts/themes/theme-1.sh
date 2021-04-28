#!/bin/bash
gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Red-Dark"
dconf write /org/gnome/shell/extensions/user-theme/name "'Flat-Remix-Red-Dark-fullPanel'"
gsettings set org.gnome.desktop.background picture-uri "$HOME/.mw_tools/Backgrounds/1.jpg"
gsettings set org.gnome.desktop.interface icon-theme "MW-Red"
