#!/bin/bash
function f_tools_firefox {
    rm ~/.local/share/applications/firefox.desktop
    touch ~/.local/share/applications/firefox.desktop

    echo "[Desktop Entry]
    Version=1.0
    Name=Firefox Web Browser
    Name[fr]=Navigateur Web Firefox
    Comment=Browse the World Wide Web
    Comment[fr]=Naviguer sur le Web
    GenericName=Web Browser
    GenericName[fr]=Navigateur Web
    Keywords=Internet;WWW;Browser;Web;Explorer
    Keywords[fr]=Internet;WWW;Browser;Web;Explorer;Fureteur;Surfer;Navigateur
    Exec=bash -c 'env GTK_THEME=Yaru-light firefox %u'
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=firefox
    Categories=GNOME;GTK;Network;WebBrowser;
    MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
    StartupNotify=true
    Actions=new-window;new-private-window;

    [Desktop Action new-window]
    Name=Open a New Window
    Name[fr]=Ouvrir une nouvelle fenêtre
    Exec=bash -c 'env GTK_THEME=Yaru-light firefox -new-window %u'

    [Desktop Action new-private-window]
    Name=Open a New Private Window
    Name[fr]=Ouvrir une nouvelle fenêtre de navigation privée
    Exec=bash -c 'env GTK_THEME=Yaru-light firefox -private-window %u'
    " >> ~/.local/share/applications/firefox.desktop
}

function f_tools_firefox-trunk {
    rm ~/.local/share/applications/firefox-trunk.desktop
    touch ~/.local/share/applications/firefox-trunk.desktop

    echo "[Desktop Entry]
    Version=1.0
    Name=Firefox Nightly Web Browser
    Name[fr]=Firefox Navigateur Web Nightly
    Comment=Browse the World Wide Web
    Comment[fr]=Naviguer sur le Web
    GenericName=Web Browser
    GenericName[fr]=Navigateur Web
    Keywords=Internet;WWW;Browser;Web;Explorer
    Keywords[fr]=Internet;WWW;Browser;Web;Explorer;Fureteur;Surfer;Navigateur
    Exec=bash -c 'env GTK_THEME=Yaru-light firefox-trunk %u'
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=firefox-trunk
    Categories=GNOME;GTK;Network;WebBrowser;
    MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
    StartupNotify=true
    Actions=new-window;new-private-window;
    StartupWMClass=Nightly

    [Desktop Action new-window]
    Name=Open a New Window
    Name[fr]=Ouvrir une nouvelle fenêtre
    Exec=bash -c 'env GTK_THEME=Yaru-light firefox-trunk -new-window %u'

    [Desktop Action new-private-window]
    Name=Open a New Private Window
    Name[fr]=Ouvrir une nouvelle fenêtre de navigation privée
    Exec=bash -c 'env GTK_THEME=Yaru-light firefox-trunk -private-window %u'
    " >> ~/.local/share/applications/firefox-trunk.desktop
}

function f_tools_sgc {

PS3='
Veuillez faire un choix : '
options=(
"Retour"
"Themes"
"keybindings Dump"
"keybindings Load"
"Backgrounds"
"Firefox Launcher light"
"Firefox-trunk Launcher light"
"LibreOffice Flatpak Launcher light"
"Supprimer Imprimante cups-browsed"
)
select opt in "${options[@]}"
do
    case $opt in
        "Retour")
            break
            ;;
        "Themes")
            clear
            mkdir ~/.mw_tools
            rm -r ~/.mw_tools/themes
            clear
            cp -r /tmp/mw_tools/ressources/scripts/themes ~/.mw_tools/themes
            chmod +x ~/.mw_tools/themes/*
            break
            ;;
        "keybindings Dump")
            clear
            mkdir ~/.mw_tools
            mkdir ~/.mw_tools/keybindings
            rm -r ~/.mw_tools/keybindings/*
            clear
            dconf dump /org/gnome/desktop/wm/keybindings/ > ~/.mw_tools/keybindings/wm-keybindings.dconf.bak
            dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > ~/.mw_tools/keybindings/media-keys-keybindings.dconf.bak
            break
            ;;
        "keybindings Load")
            clear
            dconf load /org/gnome/desktop/wm/keybindings/ < /tmp/mw_tools/ressources/scripts/keybindings/wm-keybindings.dconf.bak
            dconf load /org/gnome/settings-daemon/plugins/media-keys/ < /tmp/mw_tools/ressources/scripts/keybindings/media-keys-keybindings.dconf.bak
            break
            ;;
        "Backgrounds")
            clear
            mkdir ~/.mw_tools
            rm -r ~/.mw_tools/Backgrounds*
            clear
            cd ~/.mw_tools
            wget https://github.com/jSigma/mw_tools/releases/download/1.0.0/Backgrounds.zip
            unzip Backgrounds.zip
            rm Backgrounds.zip
            break
            ;;
        "Firefox Launcher light")
            clear
            f_tools_firefox
            break
            ;;
        "Firefox-trunk Launcher light")
            clear
            f_tools_firefox-trunk
            break
            ;;
        "LibreOffice Flatpak Launcher light")
            clear
            cp /tmp/mw_tools/ressources/applications/org.libreoffice* ~/.local/share/applications
            break
            ;;
        "Supprimer Imprimante cups-browsed")
            clear
            sudo apt-get purge --autoremove cups-browsed
            break
            ;;
    esac
done

}
