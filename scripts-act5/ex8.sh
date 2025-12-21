#!/bin/bash

ok=0

while [[ $ok -eq 0 ]]; do
    echo "Introdueix una contrasenya:"
    read -s pass
    echo

    ok=1   # Lo pongo en 1 pero si algo falla se pone en 0

    if [[ ${#pass} -lt 8 ]]; then
        echo "Error: ha de tenir almenys 8 caràcters."
        ok=0
    fi

    if ! [[ "$pass" =~ [A-Z] ]]; then
        echo "Error: ha de contenir almenys una lletra majúscula."
        ok=0
    fi

    if ! [[ "$pass" =~ [0-9] ]]; then
        echo "Error: ha de contenir almenys un número."
        ok=0
    fi

    [[ $ok -eq 0 ]] && echo "Torna-ho a provar."
done

echo "Contrasenya valida!"
