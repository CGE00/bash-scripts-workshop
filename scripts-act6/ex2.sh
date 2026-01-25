#!/bin/bash

if [[ -n "$1" ]]; then
    usuari="$1"
else
    echo "No s'ha passat cap nom d'usuari."
    echo "Introdueix un nom d'usuari:"
    read usuari
fi

opcio=""

while [[ "$opcio" != "4" ]]; do
    echo "##############################"
    echo "   Menú de comprovacions"
    echo "Usuari seleccionat: $usuari"
    echo "##############################"
    echo "1) Comprovar si té drets d'administrador"
    echo "2) Comprovar si l'usuari existeix"
    echo "3) Comprovar si el directori personal és vàlid"
    echo "4) Sortir"
    echo "Escull una opció:"
    read opcio

    case "$opcio" in
        1)
            echo
            echo "#1# Comprovant privilegis d'administrador..."
            if id -nG "$usuari" 2>/dev/null | grep -qw "sudo"; then
                echo "L'usuari $usuari ÉS administrador (està al grup sudo)."
            else
                echo "L'usuari $usuari NO és administrador."
            fi
            echo
            ;;

        2)
            echo
            echo "#2# Comprovant si l'usuari existeix..."
            if id "$usuari" >/dev/null 2>&1; then
            echo "L'usuari $usuari existeix al sistema."
            else
                echo "L'usuari $usuari NO existeix."
            fi
            echo
            ;;

        3)
            echo
            echo "#3# Comprovant directori personal..."
            home_dir=$(getent passwd "$usuari" | cut -d: -f6)

            if [[ -d "$home_dir" ]]; then
                echo "El directori personal és vàlid: $home_dir"
            else
                echo "El directori personal NO existeix o no és vàlid."
            fi
            echo
            ;;
       4)
            echo "Sortint del programa..."
            ;;

        *)
            echo "Opció no vàlida. Torna-ho a intentar."
            echo
            ;;
    esac
done

