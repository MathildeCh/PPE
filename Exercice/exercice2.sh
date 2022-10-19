#!/usr/bin/bash

rm sortie-exo2.txt
rm listes_lieux.txt

if [[ -z $3 ]];
then 
    echo "Not enough parameter passed."
    exit
fi

ANNEE=$1
MOIS=$2
NB=$3


echo "classement des $NB lieux(x) les plus cites en $MOIS-$ANNEE" > sortie-exo2.txt
egrep  "Location"  $ANNEE\_$MOIS\_*.ann | cut -f 3 | sort | uniq -c | sort -nr >> listes_lieux.txt

sed "${NB}q" listes_lieux.txt >> sortie-exo2.txt

#while [[ $i -le $NB ]]
#do
#echo 
#((i+=1))
#done


