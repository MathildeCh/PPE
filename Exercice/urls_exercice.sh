#!/usr/bin/env bash

#===============================================================================
# VOUS DEVEZ MODIFIER CE BLOC DE COMMENTAIRES.
# Ce programme récupère des informations liées à nos urls et les ajoute à un tableau HTML.
# On lance le programme en utilisant bash + chemin/nom du script
# les paramètres = le chemin vers un fichier d'url : ../URLS/urls_en.txt
#$2 = tableauHTML.html
# La forme est indicative, sentez-vous libres d'en changer !
# Notamment pour quelque chose de plus léger, il n'y a pas de norme en bash.
#===============================================================================

fichier_urls=$1 # le fichier d'URL en entrée
fichier_tableau=$2 # le fichier HTML en sortie

# !!!!!!
# ici on doit vérifier que nos deux paramètres existent, sinon on ferme!
if [ -z $2 ]
then
    echo "Not enough parameter passed."
    exit
fi
# !!!!!!

# modifier la ligne suivante pour créer effectivement du HTML
echo "<html>
        <head>
            <meta charset="UTF-8" />
            <title>TABLEAU URLS</title>
        </head>
        <body>
            <table border="solid" width="100%">
                <tr>
                    <th>N°</th>
                    <th>URLS $fichier</th>
                    <th>code HTTP</th>
                    <th>Encodage</th>
                </tr>" > $fichier_tableau

lineno=1;

while read -r line;
do
    codeHTTP=$(curl -s -L -w '%{http_code}\n' -o ciao.html $line)
    encodage=$(curl -Is -L -w '%{content_type}\n' $line | grep -i -P -o "charset=\S+" | cut -d= -f2 | head -n1)
    echo "
    <tr>
        <th>$lineno</th>
        <th><a href="$line">$line</a></th>
        <th>$codeHTTP</th>
        <th>$encodage</th>
    </tr>" >> $fichier_tableau
	# echo "Ligne $lineno: $header" >> fichier_tableau
	lineno=$((lineno+1));
done < $fichier_urls

echo "
        </table>
    </body>
</html>
" >> $fichier_tableau