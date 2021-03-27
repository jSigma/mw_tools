#!/bin/bash
function theme_install_sgc {
    icons_install_papirus
    icons_install_surfn-luv
    theme_install_flat-remix
}

function theme_remove_sgc {
    icons_remove_papirus
    icons_remove_surfn-luv
    theme_remove_flat-remix
}

function theme_sgc {
    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )

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
                theme_install_sgc
                f_break
                break
                ;;
            "Supprimer")
                clear
                f_head
                theme_remove_sgc
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
