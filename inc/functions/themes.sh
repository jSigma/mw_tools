#!/bin/bash

####################
# Clean Menu
####################
function f_themes {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Flat Remix - Thèmes"
    "MW - Icônes"
    "Yaru Colors - Thèmes et icônes"
    "Papirus - Icônes"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Flat Remix - Thèmes")
                PAGE="Flat Remix"
                clear
                theme_flat-remix
                break
                ;;
            "MW - Icônes")
                PAGE="MW - Icônes"
                clear
                icons_MW-Blue
                break
                ;;
            "Yaru Colors - Thèmes et icônes")
                PAGE="Yaru Colors - Thèmes et icônes
Pack de couleurs du thème par défaut Ubuntu"
                clear
                theme_yaru-colors
                break
                ;;
            "Surfn Luv Icônes (Dépendance Papirus)")
                PAGE="Surfn Luv - Icônes
Installer les icônes Papirus en complément"
                clear
                icons_surfn-luv
                break
                ;;
            "Papirus - Icônes")
                PAGE="Papirus - Icônes"
                clear
                icons_papirus
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
