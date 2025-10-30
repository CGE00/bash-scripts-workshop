#!/bin/bash

if [[ -e $1 ]]; then
	echo "La ruta es correcta"
else
	echo "No es una ruta correcta"
	exit 1
fi

carpeta=$1
carpetatar=$2

if [[ -d $carpeta ]]; then
	echo "Es un directori"
else
	echo "No es un directori"
fi


if [[ -f $carpetatar ]]; then
	read -p "Aquest nom ja existeix. Vols sobrescriure'l? (S/N): " resposta
	if [[ $resposta != "s" && $resposta != "S" ]]; then
		echo "Opreció cancel·lada"
		exit 1
	fi
fi

#Comprimint el directiu:
tar -czf $carpetatar $carpeta

echo "S'ha comprimit $carpeta en: "

file $carpetatar
