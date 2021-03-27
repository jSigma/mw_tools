#!/bin/bash
function f_tools {
PS3='
Veuillez faire un choix : '
options=("Retour" "Vider la Ram en cache" "SpeedTest" "HDD, Bios et Matériel" "Informations Wifi" "Informations Bluetooth" "Gnome Vanilla" "SGC")
select opt in "${options[@]}"
do
    case $opt in
        "Retour")
            clear
            break
            ;;
        "Vider la Ram en cache")
            clear
            f_tools_ram
            f_break
            break
            ;;
        "SpeedTest")
            clear
            speedtest-cli
            f_break
            break
            ;;
        "HDD, Bios et Matériel")
            PAGE="HDD, Bios et Matériel"
            f_head
            f_tools_hdd
            break
            ;;
        "Informations Wifi")
            PAGE="Informations Wifi"
            f_head
            f_tools_wifi
            break
            ;;
        "Informations Bluetooth")
            PAGE="Informations Bluetooth"
            f_head
            f_tools_bluetooth
            break
            ;;
        "Gnome Vanilla")
            PAGE="Gnome Vanilla"
            f_head
            f_tools_gnome_vanilla
            break
            ;;
        "SGC")
            PAGE="SGC"
            f_head
            f_tools_sgc
            break
            ;;
    esac
done
}
