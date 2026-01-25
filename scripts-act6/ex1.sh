#!/bin/bash

resposta=""

while [[ "$resposta" != "si" ]]; do
        echo "Vols continuar avançant en l’espiral d’emocions, alegries i èxits>
        read resposta

        case "$resposta" in
                si)
                        echo "**Que comenci el viatge emocional**"
                        xdg-open "https://youtu.be/jaLDoWqIq2M" &
                        ;;
                no)
                        echo "Sense problemes, en un altre cop."
                        ;;
                *)
                        echo "Error: Escriu -si- o -no-"
        esac
        echo "---"
done
