#!/bin/bash

#fitxer on es guardaran els resultats
LOGFILE="resultats_servidors.log"

comprovar_servidor() { #comprovar si un servidor respon al ping
        servidor="$1"

        if ping -c 1 -W 1 "$servidor" >/dev/null 2>&1; then
                echo "ACTIU"
        else
                echo "INACTIU"
        fi
} #retorna 0 si està actiu, 1 si no

registrar_resultat() { #guardar el resultat al fitxer
        servidor="$1"
        estat="$2"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $servidor - $estat" >> "$LOGFILE"
}

mostrar_menu() { #mostrar menú (opcional amb case)
        cat <<EOF
---
Comprovació de servidors
---
1. Comprovar servidors
2. Mostrar log
3. Sortir
EOF
}

SERVIDORS=( #llista de servidors a comprovar
        "8.8.8.8"
        "1.1.1.1"
)

opcio=""

while [[ "$opcio" != "3" ]]; do
        mostrar_menu
        read -p "Escull una opció: " opcio

        case "$opcio" in
                1)
                        echo "Comprovant servidors..."
                        for srv in "${SERVIDORS[@]}"; do
                                estat=$(comprovar_servidor "$srv")
                                echo "$srv → $estat"
                                registrar_resultat "$srv" "$estat"
                done
                echo "Resultats registrats a $LOGFILE"
                echo
                ;;

                2)
                        echo "Contingut del log:"
                        echo "---"
                        cat "$LOGFILE"
                echo
                ;;

                3)
                        echo "Sortint del programa..."
                ;;

                *)
                        echo "Opció no vàlida."
                ;;
        esac
done
