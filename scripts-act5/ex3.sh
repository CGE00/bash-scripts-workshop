#!/bin/bash

if [[ $# -ne 1 ]]; then # Comprobar que sea un archivo en argumento
    echo "Arxiu: $0"
    exit 1
fi

archivo="$1"

echo "Escriu paraules (':>' per acabar):"

while read -r palabra; do
    if [[ "$palabra" == ":>" ]]; then # Va leyendo cada palabra que se escribe hasta que se escriba :>
        break
    fi
    echo "$palabra" >> "$archivo"
done

echo "Paraules guardades a '$archivo'"
