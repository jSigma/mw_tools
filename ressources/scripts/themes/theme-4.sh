#!/bin/bash
gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Red"
dconf write /org/gnome/shell/extensions/user-theme/name "'Flat-Remix-Red-fullPanel'"
gsettings set org.gnome.desktop.background picture-uri "$HOME/.mw_tools/Backgrounds/4.jpg"
gsettings set org.gnome.desktop.interface icon-theme "MW-Red"
