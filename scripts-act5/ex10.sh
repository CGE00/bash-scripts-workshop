#!/bin/bash

url="https://www.insestatut.cat"

echo "Comprovant connexió amb $url ..."

connected=0

while [[ $connected -eq 0 ]]; do
    if ping -c 1 -W 1 insestatut.cat >/dev/null 2>&1; then # Enviamos un solo ping
        connected=1
    else
        echo "No hi ha connexió a Internet. Tornant a provar en 5 segons..."
        sleep 5 # Este sleep es para que no se vuelva un caos de pings
    fi
done

echo "Connexió establerta! Obrint el navegador..."
firefox "$url" & # No funciona, pero debería ser así
