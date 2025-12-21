#!/bin/bash

opcio=0

while [[ "$opcio" != "3" ]]; do
    echo "----- MENÚ -----"
    echo "1) Mostrar data i hora actual"
    echo "2) Comprovar si existeix un fitxer"
    echo "3) Sortir"
    echo "Escull una opció:"
    read opcio

    if [[ "$opcio" == "1" ]]; then
        echo "Data i hora actual:"
        date

    elif [[ "$opcio" == "2" ]]; then
        echo "Introdueix el nom del fitxer:"
        read fitxer

        if [[ -f "$fitxer" ]]; then
            echo "El fitxer existeix."
        else
            echo "El fitxer NO existeix."
        fi

    elif [[ "$opcio" == "3" ]]; then
        echo "Sortint del programa..."

    else
        echo "Opció no vàlida."
    fi

    echo
done
