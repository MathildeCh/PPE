# !/usr/bin/bash
ANNEE=$1
TYPE="$2"

echo "pour l’année $ANNEE" > sortie_exo1_part2.txt
egrep "$TYPE" $ANNEE*.ann | wc -l >> sortie_exo1_part2.txt

