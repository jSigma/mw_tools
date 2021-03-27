#!/bin/bash
function f_memo_archive {
echo "

------------------------------------------------------------------------------
COMPRESSER UNE ARCHIVE
------------------------------------------------------------------------------

    –c : crée une archive.
    –x : extrait une archive.
    –t : liste le contenus d'une archive.
    –z : compresse l’archive avec Gzip.
    –j : compresse l’archive avec Bzip2.
    –J : compresse l’archive avec Lzma2.
    –v : mode verbeux, affiche la progression.
    –f : permet de spécifier le nom du fichier d’archive.
    pigz : compression multiprocesseur avec pigz (installer pigz)
    lbzip2 : compression multiprocesseur avec lbzip2 (installer lbzip2)

-----------------
----- COMPRESSER
-----------------

    tar -cvf archive.tar [fichier.ext OU dossier(s)]
    tar -zcvf archive.tar.gz [fichier.ext OU dossier(s)]
    tar -jcvf archive.tar.bz2 [fichier.ext OU dossier(s)]
    tar -Jcvf archive.tar.xz [fichier.ext OU dossier(s)]
    tar -I pigz -cvf archive.tar.gz [fichier.ext OU dossier(s)]
    tar -I lbzip2 -cvf archive.tar.bz2 [fichier.ext OU dossier(s)]

-----------------
----- DEOMPRESSER
-----------------

    tar -xvf archive.tar
    tar -zxvf archive.tar.gz
    tar -jxvf archive.tar.bz2
    tar -Jxvf archive.tar.xz
    tar -I pigz -xvf archive.tar.gz
    tar -I lbzip2 -xvf archive.tar.bz2

    Si dossier de décompression spécifique, ajouter à la fin -C /directory

------------------------------------------------------------------------------
ZIP
------------------------------------------------------------------------------

    compresser un fichier
        zip archive.zip [fichier.ext]
    compresser un dossier
        zip -r archive.zip [dossier]
    compresser le contenu du dossier
        zip -r archive.zip *

    décompresser
        unzip archive.zip
    décompresser avec espace
        unzip 'une archive.zip'
    décompresser plusieurs zip
        unzip '*.zip'

------------------------------------------------------------------------------
RAR
------------------------------------------------------------------------------

-hp : masquer les noms et ajouter un mot de passe.

-----------------
----- COMPRESSER
-----------------

    rar a archive.rar [fichier.ext OU dossier(s)]
    rar a -hp archive.rar [fichier.ext OU dossier(s)]

-----------------
----- DEOMPRESSER
-----------------

    unrar x archive.rar


------------------------------------------------------------------------------
PIGZ
------------------------------------------------------------------------------

    pigz ne sait pas compresser des dossiers, créer une archive tar avant.

    -k, --keep : ne pas supprimer le fichier original après son traitement.
    -d, --decompress : extrait une archive.
    -K, --zip : liste le contenus d'une archive.

    compresser un fichier avec Gzip
        pigz -k fichier.ext
    compresser un fichier avec Zip
        pigz -kK fichier.ext

    décompresser avec Gzip:
        pigz -kd archive.gz
        unpigz -k archive.gz
    décompresser avec Zip:
        pigz -kd archive.zip
        unpigz -k archive.zip

"
}
