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

if hash cowsasy 2>/dev/null; then
else
    if [ "$OS" == "ubuntu" ]; then
        sudo apt install cowsay -y
    elif [ "$OS" == "fedora" ]; then
        sudo dnf install -y cowsay
    fi
fi

echo '
'
if hash cowsasy 2>/dev/null; then
    cowsay -f bunny "${mwmessage}Appuyer sur la touche ENTREE pour continuer ..."
    read -e -i "" -p "" choice
else
    read -e -i "" -p "${mwmessage}Appuyer sur la touche ENTREE pour continuer ..." choice
fi
}
