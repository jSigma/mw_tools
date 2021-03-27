#!/bin/bash
function icons_install_papirus {
    sudo apt install papirus-icon-theme -y
}
function icons_remove_papirus {
    sudo apt autoremove papirus-icon-theme -y
}

function icons_papirus {
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
                icons_install_papirus
                f_break
                break
                ;;
            "Supprimer")
                clear
                f_head
                icons_remove_papirus
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
