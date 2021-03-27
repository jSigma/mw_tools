# MW TOOLS

#### Installer GIT

    sudo apt install git -y

#### Créer le fichier du script

    nano ~/tools.sh

#### Copier le code suivant dans le fichier

```
#!/bin/bash
rm -rf /tmp/mw_tools && git clone https://github.com/jSigma/mw_tools/ /tmp/mw_tools && chmod +x /tmp/mw_tools/script.sh && bash /tmp/mw_tools/script.sh
```

**ctrl+x** pour quitter puis **Y** ou **O** pour enregistrer

#### Rendre executable le script

    chmod +x ~/tools.sh

#### Executer le script

    bash ~/tools.sh

## Liste d'extensions Gnome

Liste : https://github.com/jSigma/mw_tools/blob/master/ressources/extensions.md
