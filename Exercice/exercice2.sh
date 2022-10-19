#!/usr/bin/bash

if [ -z $3 ]
then 
    echo "Not enough parameter passed."
    exit
fi

ANNEE=$1
MOIS=$2
NB=$3

echo "classement des $NB lieux(x) les plus cites en $MOIS-$ANNEE" > sortie-exo2.txt
egrep  "Location"  $ANNEE\_$MOIS\_*.ann | cut -f 3 | sort | uniq -c | sort -nr | HEAD -n $NB >> sortie-exo2.txt


