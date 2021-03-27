#!/bin/bash
function f_quit {
    #rm -rf /tmp/mw_tools
    clear
}

function f_menu {
    cd /tmp/mw_tools
    ./script.sh
}

function f_theme_default {
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
    #gsettings set org.gnome.desktop.wm.preferences theme "Adwaita"
    #gsettings set org.gnome.shell.extensions.user-theme name "Adwaita"
    dconf write /org/gnome/shell/extensions/user-theme/name "'Adwaita'"
}

function f_break {
echo '
'
read -e -i "" -p "Entrer pour continuer : " choice
}
