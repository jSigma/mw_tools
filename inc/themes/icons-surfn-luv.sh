#!/bin/bash
function icons_install_surfn-luv {
    rm -rf /tmp/icons
    mkdir -p /tmp/icons
    cd /tmp/icons
    svn co https://github.com/erikdubois/Surfn/trunk/surfn-icons/Surfn-Luv
    svn co https://github.com/erikdubois/Surfn/trunk/surfn-icons/Surfn-Luv-Red
    mkdir -p ~/.icons
    rm -rf ~/.icons/Surfn*
    sudo rm -rf /usr/share/icons/Surfn*
    cp -r /tmp/icons/* ~/.icons/
    sudo cp -r /tmp/icons/* /usr/share/icons/
    rm -rf /tmp/icons
}

function icons_remove_surfn-luv {
    rm -rf ~/.icons/Surfn*
    sudo rm -rf /usr/share/icons/Surfn*
}

function icons_surfn-luv {
    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )

    head_page="Github : https://github.com/erikdubois/Surfn/"
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
                icons_install_surfn-luv
                f_break
                break
                ;;
            "Supprimer")
                clear
                f_head
                icons_remove_surfn-luv
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
