#!/bin/bash
function theme_install_cameo {
    sudo rm -rf /tmp/themes
    mkdir -p /tmp/themes
    cd /tmp/themes

    svn co https://github.com/paullinuxthemer/cameo/trunk/Cameo-Dark-Colors/Cameo-Dark-Blue
    svn co https://github.com/paullinuxthemer/cameo/trunk/Cameo-OSX

    echo 'stage {font-size:12px;}' >> /tmp/themes/Cameo-Dark-Blue/gnome-shell/gnome-shell.css
    echo 'stage {font-size:12px;}' >> /tmp/themes/Cameo-OSX/gnome-shell/gnome-shell.css

    mkdir -p ~/.themes
    rm -rf ~/.themes/Cameo*
    sudo rm -rf /usr/share/themes/Cameo*
    cp -r /tmp/themes/* ~/.themes/
    sudo cp -r /tmp/themes/* /usr/share/themes/
    rm -rf /tmp/themes

}

function theme_remove_cameo {
    rm -rf ~/.themes/Cameo*
    sudo rm -rf /usr/share/themes/Cameo*
}


function theme_cameo {
    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )

    head_page="Github : https://github.com/paullinuxthemer/cameo/"
    f_head

    select opt in "${options[@]}"
    do
        case $opt in
            "Quitter")
                break
                ;;
            "Installer / Mise à jour")
                clear
                f_head
                theme_install_cameo
                f_break
                break
                ;;
            "Supprimer")
                clear
                f_head
                theme_remove_cameo
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
