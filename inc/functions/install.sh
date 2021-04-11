#!/bin/bash
function f_install {

PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Ubuntu Extras"
    "Fedora Extras"
    "Anydesk"
    "Atom"
    "Audacity"
    "Bitwarden"
    "Capture Image/Vidéo"
    "Chromium"
    "Detwinner (Duplicate)"
    "Developpement"
    "Filezilla"
    "Firefox"
    "Github Desktop"
    "Krita"
    "LibreOffice"
    "Mainline Kernel"
    "Menu"
    "MediaInfo"
    "NextCloud Client"
    "OnlyOffice"
    "Opera"
    "PDF"
    "Piper (souris)"
    "Plex Player"
    "ProtonVPN"
    "Skype"
    "SpeedTest"
    "Spotify"
    "Stacer"
    "Telegram"
    "Terminal"
    "Timeshift"
    "Torrent"
    "Touchegg"
    "Uget"
    "VirtualBox"
    "VLC"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Ubuntu Extras")
                f_head
                app_ubuntu
                break
                ;;
            "Fedora Extras")
                f_head
                app_fedora
                break
                ;;
            "Anydesk")
                f_head
                app_anydesk
                break
                ;;
            "Atom")
                f_head
                app_atom
                break
                ;;
            "Audacity")
                f_head
                app_audacity
                break
                ;;
            "Bitwarden")
                f_head
                app_bitwarden
                break
                ;;
            "Capture Image/Vidéo")
                f_head
                app_capture
                break
                ;;
            "Chromium")
                f_head
                app_chromium
                break
                ;;
            "Detwinner (Duplicate)")
                f_head
                app_detwinner
                break
                ;;
            "Filezilla")
                f_head
                app_filezilla
                break
                ;;
            "Firefox")
                f_head
                app_firefox
                break
                ;;
            "Flameshot")
                f_head
                app_flameshot
                break
                ;;
            # "Flash Player")
            #     f_head
            #     app_adobe-flashplugin
            #     break
            #     ;;
            "Github Desktop")
                f_head
                app_git
                break
                ;;
            "Krita")
                f_head
                app_krita
                break
                ;;
            "LibreOffice")
                f_head
                app_libreoffice
                break
                ;;
            "Mainline Kernel")
                f_head
                app_mainline
                break
                ;;
            "Menu")
                f_head
                app_menulibre
                break
                ;;
            "MediaInfo")
                f_head
                app_mediainfo
                break
                ;;
            "NextCloud Client")
                f_head
                app_nextcloud
                break
                ;;
            "OnlyOffice")
                f_head
                app_onlyoffice
                break
                ;;
            "Opera")
                f_head
                app_opera
                break
                ;;
            "PDF")
                f_head
                app_pdf
                break
                ;;
            "Piper (souris)")
                f_head
                app_piper
                break
                ;;
            "Plex Player")
                f_head
                app_plex
                break
                ;;
            "Developpement")
                f_head
                app_dev
                break
                ;;
            "ProtonVPN")
                f_head
                app_proton
                break
                ;;
            "SimpleScreenRecorder")
                f_head
                app_simplescreenrecorder
                break
                ;;
            "Skype")
                f_head
                app_skype
                break
                ;;
            "SpeedTest")
                f_head
                app_speedtest
                break
                ;;
            "Spotify")
                f_head
                app_spotify
                break
                ;;
            "Stacer")
                f_head
                app_stacer
                break
                ;;
            "Telegram")
                f_head
                app_telegram
                break
                ;;
            "Terminal")
                f_head
                app_term
                break
                ;;
            "Timeshift")
                f_head
                app_timeshift
                break
                ;;
            "Torrent")
                f_head
                app_torrent
                break
                ;;
            "Touchegg")
                f_head
                app_touchegg
                break
                ;;
            "Uget")
                f_head
                app_uget
                break
                ;;
            "VirtualBox")
                f_head
                app_virtualbox
                break
                ;;
            "VLC")
                f_head
                app_vlc
                break
                ;;
            # "Gnome extensions")
            #     sudo apt install -y gnome-shell-extension-dash-to-panel gnome-shell-extension-dashtodock gnome-shell-extension-remove-dropdown-arrows
            #     break
            #     ;;
        esac
    done
}
