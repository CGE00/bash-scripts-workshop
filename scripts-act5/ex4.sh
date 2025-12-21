#!/bin/bash

echo "Usuaris amb majúscules en el nom:"
grep '[A-Z]' /etc/passwd | cut -d: -f1

echo "Introdueix un nom d'usuari:"
read usuari

while ! id "$usuari" >/dev/null 2>&1; do # Hace que si no existe se True
    echo "Error: l'usuari '$usuari' no existeix. Torna-ho a provar:"
    read usuari # Se pide un usuario de uevo
done

echo "Informació de l'usuari '$usuari':"
getent passwd "$usuari"
id "$usuari"
