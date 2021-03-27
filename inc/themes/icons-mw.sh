#!/bin/bash
function icons_install_MW-Blue {
    sudo rm -rf /tmp/icons
    mkdir -p /tmp/icons
    cd /tmp/icons

    if [ "$OS" == "ubuntu" ]; then
        sudo apt install yaru-theme-icon
    elif [ "$OS" == "fedora" ]; then
        sudo dnf install yaru-icon-theme
    fi

    svn co https://github.com/Jannomag/Yaru-Colors/trunk/Icons/Yaru-Blue
    mv Yaru-Blue MW-Yaru-Blue

    svn co https://github.com/Jannomag/Yaru-Colors/trunk/Icons/Yaru-Red
    mv Yaru-Red MW-Yaru-Red

    svn co https://github.com/Jannomag/Yaru-Colors/trunk/Icons/Yaru-Green
    mv Yaru-Green MW-Yaru-Green

    svn co https://github.com/jSigma/MW-Icons/trunk/MW-Flat-Blue
    svn co https://github.com/jSigma/MW-Icons/trunk/MW-Flat-Red
    svn co https://github.com/jSigma/MW-Icons/trunk/MW-Blue
    svn co https://github.com/jSigma/MW-Icons/trunk/MW-Red
    svn co https://github.com/jSigma/MW-Icons/trunk/MW-Green

    rm -rf ~/.icons/MW-*
    sudo rm -rf /usr/share/icons/MW-*

    # cp -r /tmp/icons/MW-Icons/* ~/.icons/
    sudo cp -r /tmp/icons/* /usr/share/icons/

    # rm -rf /tmp/icons
}

function icons_remove_MW-Blue {
    sudo rm -rf /usr/share/icons/MW-*
    rm -rf ~/.icons/MW-*
}

function icons_MW-Blue {

    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )

    head_page="Github : https://github.com/jSigma/MW-Icons"
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
                icons_install_MW-Blue
                gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
                sleep 1s
                gsettings set org.gnome.desktop.interface icon-theme "MW-Blue"
                f_break
                break
                ;;
            "Supprimer")
                clear
                f_head
                icons_remove_MW-Blue
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
