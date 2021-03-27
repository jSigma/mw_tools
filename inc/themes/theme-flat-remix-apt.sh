#!/bin/bash
function theme_install_flat-remix_apt {
    sudo add-apt-repository ppa:daniruiz/flat-remix
    sudo apt update
    sudo apt install flat-remix-gnome
    sudo apt install flat-remix-gtk
}
function theme_remove_flat-remix_apt {
    sudo add-apt-repository --remove ppa:daniruiz/flat-remix
    sudo apt-get update
    sudo apt autoremove flat-remix-gnome
    sudo apt autoremove flat-remix-gtk
}

function theme_flat-remix_apt {

    head_page="Site : https://drasite.com/flat-remix/"
    f_head

    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer"
    "Supprimer"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "Quitter")
                break
                ;;
            "Installer")
                clear
                f_head
                theme_install_flat-remix_apt
                f_break
                break
                ;;
            "Supprimer")
                clear
                f_head
                theme_remove_flat-remix_apt
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
