#!/bin/bash

echo "Analitzant fitxer..."

read -p "Nom del fitxer a analitzar: " fitxer #variable on es guarda el nom del fitxar
{
resultats="resultats.log"
errors="errors.log"

linies_utiles=$(cat "$fitxer" | grep -v '^$' | wc -l 2>> "$errors")


#Comptar paraules i caràcters
paraules=$(wc -w < "$fitxer")
caracters=$(wc -m < "$fitxer")

data=$(date)
usuari=$USER
directori=$PWD
pid=$$


echo "==============================="
echo "Fitxer analitzat: $fitxer"
echo "Línies útils: $linies_utiles"
echo "Paraules totals: $paraules"
echo "Caràcters totals: $caracters"
echo "Data: $data"
echo "Executat per: $usuari"
echo "Directori: $directori"
echo "PID Shell: $pid"
echo "==============================="
} >> "$resultats" 2>> "$errors"

