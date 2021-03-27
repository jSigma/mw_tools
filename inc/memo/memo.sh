#!/bin/bash
function f_memo {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Compression"
    "Rsync"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Compression")
                PAGE="Compression"
                clear
                f_memo_archive
                f_break
                break
                ;;
            "Rsync")
                PAGE="Rsync"
                clear
                f_memo_rsync
                f_break
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
