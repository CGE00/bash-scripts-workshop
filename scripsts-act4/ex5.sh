#!/bin/bash

read -p "Escriu un fitxer o el PATH d'un fitxer: " fitxer

if [[ -e $fitxer ]]; then
	echo "El fitxer existeix"
	file $fitxer
else
	echo "El fitxer no existeix"
fi 

if [[ -x $fitxer ]]; then
	echo "El fitxer es executable"
fi

