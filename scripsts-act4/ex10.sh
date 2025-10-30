#!/bin/bash

fitxer=$1
paraula=$2

if [[ ! -f "$fitxer" ]]; then
	echo "El fitxer no existeix"
	exit 1
fi

if [[ $fitxer != *.txt && $fitxer != *.csv ]]; then
	echo "El fixer no té extensió .txt o .csv"
	exit 1
fi

comptador=$(grep -i -c "$paraula" "$fitxer")

if [[ $comptador -gt 0 ]]; then
	echo "Hi han $comptador linies amb la paraula: $paraula"
else
	echo "No es troba la paraula: $paraula, en cap linia"
fi
