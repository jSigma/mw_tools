#!/bin/bash

##############################
# Fedora
##############################
function app_ubuntu {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Paquets utiles - [Ubuntu]"
    "Flatpak - [Ubuntu] (Redémarrage)"
    "Flatpak Beta - [Ubuntu]"
    "Pilotes Nvidia PPA - [Ubuntu]"
    "ZRam - [Ubuntu]"
    "EarlyOOM (Ram) - [Ubuntu]"
    "Codecs multimédias essentiels - [Ubuntu]"
    "Microsoft fonts - [Ubuntu]"
    "Fonts Microsoft & Apple - [GitHub]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Paquets utiles - [Ubuntu]")
                f_head
                sudo apt install git subversion rar bmon htop curl gnome-tweaks dfc ncdu wavemon
                f_break
                break
                ;;
            "Flatpak - [Ubuntu] (Redémarrage)")
                f_head
                sudo apt install -y flatpak gnome-software-plugin-flatpak
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                flatpak update --appstream
                f_break
                break
                ;;
            "Flatpak Beta - [Ubuntu]")
                f_head
                flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
                flatpak update --appstream
                f_break
                break
                ;;
            "Pilotes Nvidia PPA - [Ubuntu]")
                f_head
                sudo add-apt-repository ppa:graphics-drivers/ppa
                sudo apt update
                f_break
                break
                ;;
            "ZRam - [Ubuntu]")
                f_head
                sudo apt-get install zram-config
                sudo service zram-config start
                echo '
    sudo nano /usr/bin/init-zram-swapping
    mem=$(((totalmem / 2 / ${NRDEVICES}) * 1024))
    à
    mem=$(((totalmem * 2 / ${NRDEVICES}) * 1024))
    '
    f_break
                break
                ;;
            "EarlyOOM (Ram) - [Ubuntu]")
                f_head
                sudo apt install earlyoom
                f_break
                break
                ;;
            "Codecs multimédias essentiels - [Ubuntu]")
                f_head
                sudo add-apt-repository multiverse
                sudo apt install ubuntu-restricted-extras
                f_break
                break
                ;;
            "Microsoft fonts - [Ubuntu]")
                f_head
                sudo add-apt-repository multiverse
                sudo apt update && sudo apt install ttf-mscorefonts-installer
                sudo fc-cache -f -v
                f_break
                break
                ;;
            "Fonts Microsoft & Apple - [GitHub]")
                f_head
                sudo rm -r /usr/share/fonts/mw_fonts
                cd /tmp/mw_tools/
                wget https://github.com/jSigma/mw_tools/releases/download/1.0.0/mw_fonts.zip
                unzip mw_fonts.zip
                rm mw_fonts.zip
                sudo mv /tmp/mw_tools/mw_fonts /usr/share/fonts/mw_fonts
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}


##############################
# Fedora
##############################
function app_fedora {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Paquets utiles - [Fedora]"
    "Flatpak - [Fedora]"
    "Flatpak Beta - [Fedora]"
    "Snap - [Fedora]"
    "RPMFusion Free - [Fedora]"
    "RPMFusion Non-Free - [Fedora]"
    "Codecs multimédias - [Fedora]"
    "NCDU (disk space) - [Fedora]"
    "Microsoft fonts - [Fedora DNF]"
    "Fonts Microsoft & Apple - [GitHub]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Paquets utiles - [Fedora]")
                f_head
                sudo dnf install git subversion rar bmon htop curl gnome-tweaks dfc ncdu wavemon
                f_break
                break
                ;;
            "Flatpak - [Fedora]")
                f_head
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                flatpak update --appstream
                f_break
                break
                ;;
            "Flatpak Beta - [Fedora]")
                f_head
                flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
                flatpak update --appstream
                f_break
                break
                ;;
            "Snap - [Fedora]")
                f_head
                app_snap
                break
                ;;
            "RPMFusion Free - [Fedora]")
                f_head
                sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
                sudo dnf update
                sudo dnf install rpmfusion-free-appstream-data
                f_break
                break
                ;;
            "RPMFusion Non-Free - [Fedora]")
                f_head
                sudo dnf install --nogpgcheck https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
                sudo dnf update
                sudo dnf install rpmfusion-nonfree-appstream-data
                f_break
                break
                ;;
            "Codecs multimédias - [Fedora]")
                f_head
                sudo dnf install gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly
                sudo dnf install gstreamer1-plugins-{base,good,bad-free,good-extras,bad-free-extras} gstreamer1-plugin-mpg123
                sudo dnf install gstreamer1-libav gstreamer1-plugins-{bad-freeworld,ugly}
                f_break
                break
                ;;
            "NCDU (disk space) - [Fedora]")
                f_head
                sudo dnf install ncdu
                f_break
                break
                ;;
            "Microsoft fonts - [Fedora DNF]")
                f_head
                sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
                sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
                f_break
                break
                ;;
            "Fonts Microsoft & Apple - [GitHub]")
                f_head
                sudo rm -r /usr/share/fonts/mw_fonts
                cd /tmp/mw_tools/
                wget https://github.com/jSigma/mw_tools/releases/download/1.0.0/mw_fonts.zip
                unzip mw_fonts.zip
                rm mw_fonts.zip
                sudo mv /tmp/mw_tools/mw_fonts /usr/share/fonts/mw_fonts
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Snap
##############################
function app_snap {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Snap - [Fedora]"
    "Snap store - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Snap - [Fedora]")
                f_head
                sudo dnf install snapd
                sudo ln -s /var/lib/snapd/snap /snap
                f_break
                break
                ;;
            "Snap store - [Snap]")
                f_head
                sudo snap install snap-store
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Flash Player
##############################
function app_adobe-flashplugin {
echo "
ATTENTION ! Adobe Flash c'est de la marde ...
Pour supprimer : sudo apt autoremove adobe-flashplugin
"
PS3='
Veuillez faire un choix : '
options=(
"Retour"
"Flash Player - [Ubuntu]"
)

select opt in "${options[@]}"
do
    case $opt in
        "Retour")
            clear
            break
            ;;
        "Flash Player - [Ubuntu]")
            clear
            sudo apt install adobe-flashplugin
            f_break
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

##############################
# Anydesk
##############################
function app_anydesk {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Anydesk - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Anydesk - [Flatpak]")
                f_head
                flatpak install flathub com.anydesk.Anydesk
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Atom
##############################
function app_atom {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Atom - [Flatpak]"
    "Atom - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Atom - [Flatpak]")
                f_head
                flatpak install io.atom.Atom
                f_break
                break
                ;;
            "Atom - [Snap]")
                f_head
                sudo snap install atom --classic
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Audacity
##############################
function app_audacity {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Audacity - [Flatpak]"
    "Audacity - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Audacity - [Flatpak]")
                f_head
                flatpak install flathub org.audacityteam.Audacity
                f_break
                break
                ;;
            "Audacity - [Snap]")
                f_head
                sudo snap install audacity
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Bitwarden
##############################
function app_bitwarden {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Bitwarden - [Flatpak]"
    "Bitwarden - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Bitwarden - [Flatpak]")
                f_head
                flatpak install com.bitwarden.desktop
                f_break
                break
                ;;
            "Bitwarden - [Snap]")
                f_head
                sudo snap install bitwarden
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Chromium
##############################
function app_chromium {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Chromium - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Chromium - [Snap]")
                f_head
                sudo snap install chromium
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Detwinner
##############################
function app_detwinner {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Detwinner (Duplicate) - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Detwinner (Duplicate) - [Flatpak]")
                f_head
                flatpak install flathub com.neatdecisions.Detwinner
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Filezilla
##############################
function app_filezilla {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Filezilla - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Filezilla - [Flatpak]")
                f_head
                flatpak install flathub org.filezillaproject.Filezilla
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Firefox
##############################
function app_firefox {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Firefox - [Ubuntu]"
    "Firefox Beta - [Ubuntu]"
    "Firefox Nightly - [Ubuntu]"
    "Firefox Beta (Désinstaller) - [Ubuntu]"
    "Firefox Nightly (Désinstaller) - [Ubuntu]"
    "Firefox beta - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Firefox beta - [Flatpak]")
                f_head
                flatpak install --user https://flathub.org/beta-repo/appstream/org.mozilla.firefox.flatpakref
                f_break
                break
                ;;
            # "Firefox beta - [Snap]")
            #     f_head
            #     sudo snap install firefox --beta
            #     f_break
            #     break
            #     ;;
            "Firefox - [Ubuntu]")
                f_head
                sudo apt update && sudo apt install firefox
                f_break
                break
                ;;
            "Firefox Beta - [Ubuntu]")
                f_head
                sudo add-apt-repository ppa:mozillateam/firefox-next
                sudo apt update
                sudo apt install firefox
                sudo apt-get install firefox-locale-fr
                f_break
                break
                ;;
            "Firefox Beta (Désinstaller) - [Ubuntu]")
                f_head
                sudo add-apt-repository --remove ppa:mozillateam/firefox-next
                sudo apt autoremove --purge firefox
                f_break
                break
                ;;
            "Firefox Nightly - [Ubuntu]")
                f_head
                sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
                sudo apt-get update
                sudo apt-get install firefox-trunk
                sudo apt-get install firefox-trunk-locale-fr
                f_break
                break
                ;;
            "Firefox Nightly (Désinstaller) - [Ubuntu]")
                f_head
                sudo add-apt-repository --remove ppa:ubuntu-mozilla-daily/ppa
                sudo apt-get autoremove --purge firefox-trunk
                sudo apt-get autoremove --purge firefox-trunk-locale-fr
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Flameshot
##############################
function app_flameshot {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Flameshot - [Ubuntu]"
    "Flameshot - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Flameshot - [Ubuntu]")
                f_head
                sudo apt install flameshot
                f_break
                break
                ;;
            "Flameshot - [Fedora]")
                f_head
                sudo dnf install flameshot
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Github Desktop
##############################
function app_git {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Github Desktop - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Github Desktop - [URL]")
                f_head
                xdg-open https://github.com/shiftkey/desktop
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Krita
##############################
function app_krita {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Krita - [Flatpak]"
    "Krita - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Krita - [Flatpak]")
                f_head
                flatpak install flathub org.kde.krita
                f_break
                break
                ;;
            "Krita - [Snap]")
                f_head
                sudo snap install krita
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# LibreOffice
##############################
function app_libreoffice {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "LibreOffice - [Flatpak]"
    "LibreOffice - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "LibreOffice - [Flatpak]")
                f_head
                flatpak install flathub org.libreoffice.LibreOffice
                f_break
                break
                ;;
            "LibreOffice - [Snap]")
                f_head
                sudo snap install libreoffice
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Mainline
##############################
function app_mainline {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Mainline Kernel - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Mainline Kernel - [Ubuntu]")
                f_head
                sudo add-apt-repository ppa:cappelikan/ppa
            	sudo apt update
            	sudo apt install mainline
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# MediaInfo
##############################
function app_mediainfo {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "MediaInfo - [Flatpak]"
    "MediaInfo - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "MediaInfo - [Flatpak]")
                f_head
                flatpak install flathub net.mediaarea.MediaInfo
                f_break
                break
                ;;
            "MediaInfo - [Snap]")
                f_head
                sudo snap install mediainfo
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Menu
##############################
function app_menulibre {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "AppEditor - [Flatpak]"
    "MenuLibre - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "AppEditor - [Flatpak]")
                f_head
                flatpak install flathub com.github.donadigo.appeditor
                f_break
                break
                ;;
            "MenuLibre - [Ubuntu]")
                f_head
                sudo apt install menulibre
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# NextCloud
##############################
function app_nextcloud {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "NextCloud Client - [Flatpak]"
    "NextCloud Client Dev - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "NextCloud Client - [Flatpak]")
                f_head
                flatpak install flathub org.nextcloud.Nextcloud
                #flatpak override --user --own-name=org.kde.* org.nextcloud.Nextcloud
                f_break
                break
                ;;
            "NextCloud Client Dev - [Ubuntu]")
                f_head
                sudo add-apt-repository ppa:nextcloud-devs/client
                sudo apt update
                sudo apt install nextcloud-client nextcloud-client-nautilus nautilus-nextcloud
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# OnlyOffice
##############################
function app_onlyoffice {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "OnlyOffice - [Snap]"
    "OnlyOffice - [Flatpak] (Polices manquantes)"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "OnlyOffice - [Snap]")
                f_head
                sudo snap install onlyoffice-desktopeditors
                f_break
                break
                ;;
            "OnlyOffice - [Flatpak] (Polices manquantes)")
                f_head
                flatpak install org.onlyoffice.desktopeditors
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Opera
##############################
function app_opera {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Opera - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Opera - [Snap]")
                f_head
                sudo snap install opera
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# PDF
##############################
function app_pdf {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "PDF Arranger - [Flatpak]"
    "PDF Mix Tool - [Flatpak]"
    "PDF Mix Tool - [Snap]"
    "PDF Okular - [Flatpak]"
    "PDF Okular - [Snap]"
    "PDF Slicer - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "PDF Arranger - [Flatpak]")
                f_head
                flatpak install flathub com.github.jeromerobert.pdfarranger
                f_break
                break
                ;;
            "PDF Mix Tool - [Flatpak]")
                f_head
                flatpak install flathub eu.scarpetta.PDFMixTool
                f_break
                break
                ;;
            "PDF Mix Tool - [Snap]")
                f_head
                sudo snap install pdfmixtool
                f_break
                break
                ;;
            "PDF Okular - [Flatpak]")
                f_head
                flatpak install org.kde.okular
                f_break
                break
                ;;
            "PDF Okular - [Snap]")
                f_head
                sudo snap install okular
                f_break
                break
                ;;
            "PDF Slicer - [Flatpak]")
                f_head
                flatpak install flathub com.github.junrrein.PDFSlicer
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Piper
##############################
function app_piper {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Piper - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Piper - [Flatpak]")
                f_head
                flatpak install flathub org.freedesktop.Piper
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Plex
##############################
function app_plex {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Plex Player - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Plex Player - [URL]")
                f_head
                xdg-open https://knapsu.eu/plex/
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Proton
##############################
function app_proton {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "ProtonVPN - [URL]"
    "Désinstaller ProtonVPN PIP3 - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "ProtonVPN - [URL]")
                f_head
                xdg-open https://protonvpn.com/support/official-linux-client/
                xdg-open https://protonvpn.com/support/knowledge-base/official-linux-client
                f_break
                break
                ;;
            # "ProtonVPN - [Fedora]")
            #     f_head
            #     sudo wget -q -O - https://repo.protonvpn.com/debian/public_key.asc | sudo apt-key add - && sudo add-apt-repository 'deb [arch=amd64] https://repo.protonvpn.com/debian unstable main'
            #     sudo apt-get update && sudo apt-get install protonvpn
            #     f_break
            #     break
            #     ;;
            "Désinstaller ProtonVPN PIP3 - [Ubuntu]")
                f_head
                sudo pip3 uninstall protonvpn-cli
                sudo apt autoremove --purge dialog python3-pip python3-setuptools
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done

}

##############################
# Sass
##############################
function app_dev {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "PO Poedit - [Flatpak]"
    "PO Gtranslator- [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "PO Poedit - [Flatpak]")
                f_head
                flatpak install flathub net.poedit.Poedit
                f_break
                break
                ;;
            "PO Gtranslator- [Flatpak]")
                f_head
                flatpak install flathub org.gnome.Gtranslator
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# SimpleScreenRecorder
##############################
function app_simplescreenrecorder {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "SimpleScreenRecorder - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "SimpleScreenRecorder - [Snap]")
                f_head
                sudo snap install simplescreenrecorder
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Skype
##############################
function app_skype {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Skype - [Flatpak]"
    "Skype - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Skype - [Flatpak]")
                f_head
                flatpak install flathub com.skype.Client
                f_break
                break
                ;;
            "Skype - [Snap]")
                f_head
                sudo snap install skype --classic
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# SpeedTest
##############################
function app_speedtest {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "SpeedTest - [Ubuntu]"
    "SpeedTest - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "SpeedTest - [Ubuntu]")
                f_head
                sudo apt install speedtest-cli
                pip install speedtest-cli
                f_break
                break
                ;;
            "SpeedTest - [Fedora]")
                f_head
                sudo dnf install speedtest-cli
                pip install speedtest-cli
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Spotify
##############################
function app_spotify {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Spotify - [Flatpak]"
    "Spotify - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Spotify - [Flatpak]")
                f_head
                flatpak install com.spotify.Client
                f_break
                break
                ;;
            "Spotify - [Snap]")
                f_head
                sudo snap install spotify
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Stacer
##############################
function app_stacer {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Stacer - [Ubuntu]"
    "Stacer - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Stacer - [Ubuntu]")
                f_head
                sudo apt install stacer
                f_break
                break
                ;;
            "Stacer - [Fedora]")
                f_head
                sudo dnf install stacer
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Telegram
##############################
function app_telegram {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Telegram - [Flatpak]"
    "Telegram - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Telegram - [Flatpak]")
                f_head
                flatpak install org.telegram.desktop
                f_break
                break
                ;;
            "Telegram - [Snap]")
                f_head
                sudo snap install telegram-desktop
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Terminal
##############################
function app_term {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Guake (Xorg) - [Ubuntu]"
    "Tilix - [Ubuntu]"
    "Tilix - [Fedora]"
    "StarShip - [Snap]"
    "Powerline - [Ubuntu]"
    "Powerline - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Guake (Xorg) - [Ubuntu]")
                f_head
                sudo apt install guake
                f_break
                break
                ;;
            "Tilix - [Ubuntu]")
                f_head
                sudo apt install tilix
                echo '
    ---
    Lancer le mode Guake
    Sur Xorg : tilix --quake
    Sur Wayland : env GDK_BACKEND=x11 tilix --quake
    ---
                '
                f_break
                break
                ;;
            "Tilix - [Fedora]")
                f_head
                sudo dnf install tilix
                echo '
    ---
    Lancer le mode Guake
    Sur Xorg : tilix --quake
    Sur Wayland : env GDK_BACKEND=x11 tilix --quake
    ---
                '
                f_break
                break
                ;;
            "StarShip - [Snap]")
                f_head
                sudo snap install starship
                echo 'eval "$(starship init bash)"'
                cp /tmp/mw_tools/ressources/scripts/configs/starship.toml ~/.config/starship.toml
                f_break
                break
                ;;
            "Powerline - [Ubuntu]")
                f_head
                sudo apt install powerline
                echo '
    Copier le code ci dessous dans ~/.bashrc

    if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
        source /usr/share/powerline/bindings/bash/powerline.sh
    fi
                '
                f_break
                break
                ;;
            "Powerline - [Fedora]")
                f_head
                sudo dnf install powerline
                echo '
    Copier le code ci dessous dans ~/.bashrc

    if [ -f `which powerline-daemon` ]; then
      powerline-daemon -q
      POWERLINE_BASH_CONTINUATION=1
      POWERLINE_BASH_SELECT=1
      . /usr/share/powerline/bash/powerline.sh
    fi
                '
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Timeshift
##############################
function app_timeshift {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Timeshift - [Ubuntu]"
    "Timeshift - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Timeshift - [Ubuntu]")
                f_head
                sudo add-apt-repository -y ppa:teejee2008/timeshift
                sudo apt-get update
                sudo apt-get install timeshift
                f_break
                break
                ;;
            "Timeshift - [Fedora]")
                f_head
                sudo dnf install timeshift
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
##############################
# Torrent
##############################
function app_torrent {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "qBittorrent - [Flatpak]"
    "Transmission - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "qBittorrent - [Flatpak]")
                f_head
                flatpak install flathub org.qbittorrent.qBittorrent
                f_break
                break
                ;;
            "Transmission - [Flatpak]")
                f_head
                flatpak install flathub com.transmissionbt.Transmission
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
##############################
# Touchegg
##############################
function app_touchegg {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Touchegg - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Touchegg - [URL]")
                f_head
                xdg-open https://github.com/JoseExposito/touchegg/releases
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Uget
##############################
function app_uget {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Uget - [Ubuntu]"
    "Uget - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Uget - [Ubuntu]")
                f_head
                sudo apt install uget
                f_break
                break
                ;;
            "Uget - [Fedora]")
                f_head
                sudo dnf install uget
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# VirtualBox
##############################
function app_virtualbox {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "VirtualBox - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "VirtualBox - [URL]")
                f_head
                xdg-open https://www.virtualbox.org/wiki/Downloads
                f_break
                break
                ;;
            "VirtualBox + ExtPack par Oracle - [Ubuntu]")
                f_head
                cd /tmp
                wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - &&
                wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - &&
                echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list &&
                sudo apt update &&
                sudo apt install linux-headers-$(uname -r) dkms &&
                sudo apt-get install virtualbox-6.1 &&
                wget https://download.virtualbox.org/virtualbox/6.1.6/Oracle_VM_VirtualBox_Extension_Pack-6.1.6.vbox-extpack &&
                sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.6.vbox-extpack
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# VLC
##############################
function app_vlc {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "VLC - [Flatpak]"
    "VLC - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "VLC - [Flatpak]")
                f_head
                flatpak install flathub org.videolan.VLC
                f_break
                break
                ;;
            "VLC - [Snap]")
                f_head
                sudo snap install vlc
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
