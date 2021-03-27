#!/bin/bash
function f_memo_rsync {
echo "

------------------------------------------------------------------------------
RSYNC, SYNCHRONISER DEUX DOSSIERS
------------------------------------------------------------------------------

    --archive, -a           : mode archive ; équivaut à -rlptgoD (no -H,-A,-X)
    --dry-run, -n           : simulation
    --verbose, -v           : mode verbeux
    --progress              : voir la progression
    --delete                : supprimer les fichiers qui ne correspondent plus
    --human-readable, -h    : chiffres dans un format lisible par l'homme

-----

    rsync -avh --progress --delete folder/ folder_backup/


"
}
