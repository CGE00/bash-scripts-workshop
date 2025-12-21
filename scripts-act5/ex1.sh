#!/bin/bash

fitxer=Act3_parole.txt
tmp=fitxer-tmp.txt
nou=fitxer-nou.txt

num=$(wc -l < "$fitxer")

echo "Linies: $num"

> "$tmp"

for (( i=1; i<=num; i++ )); do # i aumenta fins que arribi al numero de linies
    linea=$(sed -n "${i}p" "$fitxer") # agafa la linia indicada per 1

    if [[ "$linea" == *"#"* ]]; then #if per saltar les linies comentades
        continue
    fi

    echo "$linea" >> "$tmp" # cada linia s'envia a un arxiu temporal
done

mv "$tmp" "$nou" # substitueix el fitxer temporal per un nou




#IFS=$'\n'
#for linia in $(cat "$fitxer");
#do
#    	neta="${linia%%\#*}" # Elimina tota la linia pertir desde
#	echo "$neta"
#done > "$fitxernet"

#read -p "Paraula per buscar: " buscar

#if grep -q "$buscar" "$fitxernet"; then
#	echo "Existeix"
#else
#	echo "No existeix"
#fi
