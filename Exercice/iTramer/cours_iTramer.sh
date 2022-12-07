#!/usr/bin/env bash

#arguments
if [[ $# -ne 2 ]]
then
    echo "Deux arguments attendus"
    exit
fi

folder=$1 #dump.text
basename=$2 #la langue : fr, it, ...

echo "<lang=\"$basename\">" > "itrameur/$folder-$basename.txt"

for filepath in $(ls $folder/$basename-*.txt)
do
    #filepath == dumps-texts/fr-1.txt
    #==> pagename = fr-1
    pagename=$(basename -s .txt $filepath)

    echo "<page!\"$pagename\">" >> "itrameur/$folder-$basename.txt"
    echo "<text>" >> "itrameur/$folder-$basename.txt"

    #on récupère les dumps/contexte
    #et on écrit à l'inté de la balise text
    content=$(cat $filepath)
    #ATTENTION ordre important : & en premier
    content=$(echo "$content" | sed 's/&/&amp/g')
    content=$(echo "$content" | sed 's/</&lt/g')
    content=$(echo "$content" | sed 's/</&gt/g')
    echo "$content" >> "itrameur/$folder-$basename.txt"

    echo "</text>" >> "itrameur/$folder-$basename.txt"
    echo "</page>" >> "itrameur/$folder-$basename.txt"

done
