#!/bin/bash
function theme_install_flat-remix {
    sudo rm -rf /tmp/themes
    mkdir -p /tmp/themes
    cd /tmp/themes

    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Blue-Dark
    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Blue-Darker
    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Blue
    svn co https://github.com/daniruiz/flat-remix-gnome/trunk/Flat-Remix-Blue-Dark-fullPanel
    svn co https://github.com/daniruiz/flat-remix-gnome/trunk/Flat-Remix-Blue-fullPanel

    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Red-Dark
    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Red-Darker
    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Red
    svn co https://github.com/daniruiz/flat-remix-gnome/trunk/Flat-Remix-Red-Dark-fullPanel
    svn co https://github.com/daniruiz/flat-remix-gnome/trunk/Flat-Remix-Red-fullPanel

    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Green-Dark
    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Green-Darker
    svn co https://github.com/daniruiz/flat-remix-gtk/trunk/Flat-Remix-GTK-Green
    svn co https://github.com/daniruiz/flat-remix-gnome/trunk/Flat-Remix-Green-Dark-fullPanel
    svn co https://github.com/daniruiz/flat-remix-gnome/trunk/Flat-Remix-Green-fullPanel

    mkdir -p ~/.themes
    rm -rf ~/.themes/Flat-Remix*
    sudo rm -rf /usr/share/themes/Flat-Remix*
    # cp -r /tmp/themes/* ~/.themes/
    sudo cp -r /tmp/themes/* /usr/share/themes/
    rm -rf /tmp/themes
}

function theme_remove_flat-remix {
    rm -rf ~/.themes/Flat-Remix*
    sudo rm -rf /usr/share/themes/Flat-Remix*
}

function theme_flat-remix {

    head_page="Github : https://github.com/daniruiz/flat-remix-gtk/
https://github.com/daniruiz/flat-remix-gnome/"
    f_head

    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "Quitter")
                break
                ;;
            "Installer / Mise à jour")
                clear
                f_head
                theme_install_flat-remix
                f_break
                break
                ;;
            "Supprimer")
                clear
                f_head
                theme_remove_flat-remix
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
