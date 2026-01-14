#!/bin/bash

echo "Log Doctor - analitzador de logs"
echo "---"

if [[ -n "$1" ]]; then # Per comprovar si hi ha un argument
	log="$1"
else
	echo "No has indicat cap arxiu. Introdueix el nom de l'arxiu"
	read log
fi

while [[ ! -f "$log" || ! -r "$log" ]]; do # Per comprovar si no exiteix o no espot llegir
	echo "El fitxer no existeix o no es llegible"
	echo "Introdueix un fitxer vàlid: "
	read log
done

echo "Arxiu seleccionat: $log"
echo "---"

linies=$(wc -l < "$log")

errors=$(grep -c "FAILED" "$log")

warnings=$(grep -c "WARNING" "$log")

echo "Total de línies: $linies"
echo "Línies amb ERROR: $errors"
echo "Línies amb WARNING: $warnings"

echo "Quants informes vols crear?"
read N

while ! [[ "$N" =~ ^[0-9]+$ ]] || [[ "$N" -le 0 ]]; do # Comprova que sigui enter i mes de 0
	echo "Error: ha de ser un numero enter i postiu"
	read N
done

for ((i=1; i<=N; i++)); do
	informe="informe_${i}.txt"
	echo "--Creant $informe--"

	{
	echo "Informe número $i"
	echo "---"
	echo "Total de línies: $linies"
	echo "Línies amb ERROR: $errors"
	echo "Línies amb WARNING: $warnings"
	} > "$informe"
done

echo "---"
echo "S'han creat $N informes"
