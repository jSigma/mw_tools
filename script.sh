#!/bin/bash
# mwdate=$(curl https://api.github.com/repos/jsigma/mw_tools/commits/master 2>&1 | grep '"date"' | tail -n 1 | cut -c16-25)
# echo "date:$mwdate" > /tmp/mw_tools/config
# Update : $(cat /tmp/mw_tools/config | grep 'date:' | cut -c6-15)"
mwmessage=""
mwdate="2021-04-11"

cp /tmp/mw_tools/tools.sh ~/tools.sh
chmod +x ~/tools.sh

# Detect OS
if cat /etc/*release | grep ^NAME | grep Fedora; then
OS="fedora"
elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
OS="ubuntu"
elif cat /etc/*release | grep ^NAME | grep Debian; then
OS="ubuntu"
elif cat /etc/*release | grep ^NAME | grep Mint; then
OS="ubuntu"
else
echo "
---

OS Ubuntu/Fedora NOT DETECTED"
read -e -i "" -p "Entrer pour continuer : " choice
fi

clear

PAGE="GitHub : https://github.com/jsigma/mw_tools
Compatibility : Ubuntu 20+ / Fedora 32+"
head_page="Update : ${mwdate}"

PWD=/tmp/mw_tools

chmod +x ${PWD}/inc/*.sh
source ${PWD}/inc/source.sh

f_head

PS3='
Veuillez faire un choix : '

options=(
"Quitter"
"Système"
"Thèmes"
"Logiciels"
"Outils"
"Mémos"
)

select opt in "${options[@]}"
do
    case $opt in
        "Quitter")
            f_quit
            exit 0
            ;;
        "Système")
            PAGE="Système"
            f_head
            f_clean
            f_menu
            break
            ;;
        "Thèmes")
            PAGE="Thèmes"
            f_head
            f_themes
            f_menu
            break
            ;;
        "Logiciels")
            PAGE="Logiciels"
            f_head
            f_install
            f_menu
            break
            ;;
        "Outils")
            PAGE="Outils"
            f_head
            f_tools
            f_menu
            break
            ;;
        "Mémos")
            PAGE="Mémos"
            f_head
            f_memo
            f_menu
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
