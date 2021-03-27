#!/bin/bash
function theme_install_yaru-colors {
    sudo rm -rf /tmp/themes
    mkdir -p /tmp/themes
    cd /tmp/themes
    git clone https://github.com/Jannomag/Yaru-Colors.git
    mkdir -p ~/.themes
    rm -rf ~/.themes/Yaru-Colors*
    rm -rf ~/.icons/Yaru-Colors*
    cd /tmp/themes/Yaru-Colors/Themes/
    for i in *; do mv $i ${i/Yaru/Yaru-Colors}; done
    cd /tmp/themes/Yaru-Colors/Icons/
    for i in *; do mv $i ${i/Yaru/Yaru-Colors}; done
    sudo rm -rf /usr/share/themes/Yaru-Colors*
    sudo rm -rf /usr/share/icons/Yaru-Colors*
    # cp -r /tmp/themes/Yaru-Colors/Themes/* ~/.themes/
    # cp -r /tmp/themes/Yaru-Colors/Icons/* ~/.icons/
    sudo cp -r /tmp/themes/Yaru-Colors/Themes/* /usr/share/themes/
    sudo cp -r /tmp/themes/Yaru-Colors/Icons/* /usr/share/icons/
    rm -rf /tmp/themes
}

function theme_remove_yaru-colors {
    sudo rm -rf /usr/share/themes/Yaru-Colors*
    sudo rm -rf /usr/share/icons/Yaru-Colors*
    # rm -rf ~/.themes/Yaru-Colors*
    # rm -rf ~/.icons/Yaru-Colors*
}

function theme_yaru-colors {
    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )

    head_page="Github : https://github.com/Jannomag/Yaru-Colors"
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
                theme_install_yaru-colors
                f_break
                break
                ;;
            # "Installer / Mise à jour Avec Papirus")
            #     clear
            #     f_head
            #     theme_install_yaru-colors
            #     sed -i 's/Inherits=/Inherits=Papirus,/g' ~/.icons/Yaru-Colors*/index.theme
            #     f_break
            #     break
            #     ;;
            "Supprimer")
                clear
                f_head
                theme_remove_yaru-colors
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
