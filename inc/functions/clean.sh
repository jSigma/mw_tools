#!/bin/bash
function f_update {

if [ "$OS" == "ubuntu" ]; then
    # Update Ubuntu
    # sudo apt install -y git subversion curl cowsay
    if ! dpkg -s 'git' >/dev/null 2>&1; then
        sudo apt install git -y
    fi
    if ! dpkg -s 'subversion' >/dev/null 2>&1; then
        sudo apt install subversion -y
    fi
    if ! dpkg -s 'curl' >/dev/null 2>&1; then
        sudo apt install curl -y
    fi
    sudo apt update && sudo apt upgrade && sudo apt full-upgrade
    sudo snap refresh
    flatpak update
    mwmessage="Votre PC est à jour ! "
elif [ "$OS" == "fedora" ]; then
    # Update Fedora
    sudo dnf install -y git subversion curl
    sudo sudo dnf upgrade && sudo dnf distro-sync
    flatpak update
    sudo snap refresh
    mwmessage="Votre PC est à jour ! "
fi

}

####################
# Clean 1
####################
function f_clean1 {

if [ "$OS" == "ubuntu" ]; then
sudo apt remove popularity-contest -y
# Clean Ubuntu
if ! dpkg -s 'trash-cli' >/dev/null 2>&1; then
    sudo apt install trash-cli -y
fi
trash-empty
rm -r -f ~/.local/share/Trash/files/*
sudo apt-get autoremove -y
sudo apt-get clean -y
sudo apt-get autoclean -y
# sudo apt --purge autoremove -y
# sudo aptitude purge ~c -y
find ~/.thumbnails -type f -atime +1 -exec rm {} \;
find ~/ -type d -iname 'cache' -exec rm -rf {} \;
# find ~/ -type d -iname '.cache' -exec rm -rf {} \;
find ~/.cache/* -maxdepth 1 ! -name 'pvpn*' ! -name 'proton*' -exec rm -rf {} \;
find ~/ -type d -iname 'caches' -exec rm -rf {} \;
find ~/ -type d -iname '.caches' -exec rm -rf {} \;
find ~/ -type d -iname '.DS_Store' -exec rm -rf {} \;
find ~/.config/ -type d -empty -delete
find ~/ -type d -iname '*~' -exec rm {} \;
# find ~/ -name '*~' -print0 | xargs rm -Rf
flatpak uninstall --unused
flatpak uninstall --delete-data -y
# sudo rm -rf /tmp/*
# find ~/ -type d \( ! -name .protonvpn-cli \) -prune -o -name '*~' -exec rm {} \;
mwmessage="Le PC est propre. "

elif [ "$OS" == "fedora" ]; then
# Clean Fedora
if ! rpm -qa | grep 'trash-cli' >/dev/null 2>&1; then
    sudo dnf install trash-cli -y
fi
trash-empty
rm -r -f ~/.local/share/Trash/files/*
sudo dnf autoremove -y
sudo dnf clean all -y
find ~/.thumbnails -type f -atime +1 -exec rm {} \;
find ~/ -type d -iname 'cache' -exec rm -rf {} \;
find ~/ -type d -iname '.cache' -exec rm -rf {} \;
find ~/ -type d -iname 'caches' -exec rm -rf {} \;
find ~/ -type d -iname '.caches' -exec rm -rf {} \;
find ~/ -type d -iname '.DS_Store' -exec rm -rf {} \;
find ~/.config/ -type d -empty -delete
find ~/ -type d -iname '*~' -exec rm {} \;
# find ~/ -name '*~' -print0 | xargs rm -Rf
flatpak uninstall --unused
flatpak uninstall --delete-data -y
mwmessage="Le PC est propre. "
fi

}

####################
# Clean 2
####################
function f_clean2 {

if [ "$OS" == "ubuntu" ]; then
echo "
---

=> Ne pas faire attention à : 'dpkg: erreur'
=> C'est qu'il n'y a rien à supprimer ...

---
"
sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)

elif [ "$OS" == "fedora" ]; then

echo "
---

=> Option non prévu pour Fedora

---
"
fi

}

function f_clean_var {
    sudo find /var/log -type f -regex ".*\.gz$" | sudo xargs rm -Rf
    sudo find /var/log -type f -regex ".*\.[0-9]$" | sudo xargs rm -Rf
    sudo find /var/log -type f -regex ".*\.old$" | sudo xargs rm -Rf
    sudo rm -rf /var/crash/*
    if [ "$OS" == "ubuntu" ]; then
        sudo rm /var/cache/apt/archives/*.deb
    fi
}

####################
# Clean Menu
####################
function f_clean {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Mises à jour APT/Snap/FlatPak"
    "Nettoyage complet"
    "Purger configuration inutile DPKG"
    "Purge /var"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Mises à jour APT/Snap/FlatPak")
                clear
                f_update
                f_break
                break
                ;;
            "Nettoyage complet")
                clear
                f_clean1
                f_break
                break
                ;;
            "Purger configuration inutile DPKG")
                clear
                f_clean2
                f_break
                break
                ;;
            "Purge /var")
                clear
                f_clean_var
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
