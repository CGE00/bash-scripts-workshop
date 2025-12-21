#!/bin/bash

echo "Joc de pedra, paper o tisores!"

resposta="s"

while [[ "$resposta" == "s" ]]; do
    echo "Escull (pedra, paper, tisores):"
    read usuari

    # Comprobando la respuesta
    if [[ "$usuari" != "pedra" && "$usuari" != "paper" && "$usuari" != "tisores" ]]; then
        echo "Opció no vàlida."
        continue
    fi

    opcions=("pedra" "paper" "tisores")
    maquina=${opcions[$RANDOM % 3]} # Un resultado random

    echo "La màquina ha triat: $maquina"

    # Comprobar quien gana
    if [[ "$usuari" == "$maquina" ]]; then
        echo "Empat!"
    elif [[ "$usuari" == "pedra" && "$maquina" == "tisores" ]] ||
         [[ "$usuari" == "paper" && "$maquina" == "pedra" ]] ||
         [[ "$usuari" == "tisores" && "$maquina" == "paper" ]]; then
        echo "Has guanyat!"
    else
        echo "Has perdut!"
    fi

    echo "Vols jugar una altra vegada? (s/n)"
    read resposta
done

echo "Gràcies per jugar!"
