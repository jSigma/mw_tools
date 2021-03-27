#!/bin/bash

####################
# Functions
####################
chmod +x ${PWD}/inc/functions/*.sh
source ${PWD}/inc/functions/functions.sh
source ${PWD}/inc/functions/sign.sh
source ${PWD}/inc/functions/clean.sh
source ${PWD}/inc/functions/themes.sh
source ${PWD}/inc/functions/install.sh
source ${PWD}/inc/functions/tools.sh

####################
# Themes
####################
chmod +x ${PWD}/inc/themes/*.sh
source ${PWD}/inc/themes/icons-papirus.sh
source ${PWD}/inc/themes/icons-surfn-luv.sh
source ${PWD}/inc/themes/theme-flat-remix.sh
source ${PWD}/inc/themes/theme-sgc.sh
source ${PWD}/inc/themes/theme-yaru-colors.sh
source ${PWD}/inc/themes/theme-flat-remix-apt.sh
source ${PWD}/inc/themes/theme-cameo.sh
source ${PWD}/inc/themes/icons-mw.sh

####################
# Applications
####################
chmod +x ${PWD}/inc/install/*.sh
source ${PWD}/inc/install/full.sh

####################
# Tools
####################
chmod +x ${PWD}/inc/tools/*.sh
source ${PWD}/inc/tools/ram.sh
source ${PWD}/inc/tools/hdd.sh
source ${PWD}/inc/tools/wifi.sh
source ${PWD}/inc/tools/bluetooth.sh
source ${PWD}/inc/tools/gnome.sh
source ${PWD}/inc/tools/sgc.sh

####################
# Mémo
####################
chmod +x ${PWD}/inc/memo/*.sh
source ${PWD}/inc/memo/memo.sh
source ${PWD}/inc/memo/rsync.sh
source ${PWD}/inc/memo/archives.sh
