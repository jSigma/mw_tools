#!/bin/bash
function f_memo_onedrive {
echo "

------------------------------------------------------------------------------
Installer Onedrive
------------------------------------------------------------------------------

    Fedora : sudo dnf install onedrive
    Ubuntu : sudo apt install onedrive


    Se connecter :
        onedrive

    Synchroniser :
        onedrive --synchronize

    Lancer :
        systemctl --user start onedrive

    Stopper :
        systemctl --user stop onedrive

    Lancer au démarrage :
        systemctl --user enable onedrive

    Etat :
        systemctl status --user onedrive
"
}
