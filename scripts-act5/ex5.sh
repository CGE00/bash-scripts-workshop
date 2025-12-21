#!/bin/bash

# Pedir un directorio hasta que sea válido
until [[ -d "$dir" ]]; do
    echo "Introdueix un directori:"
    read dir
done

echo "Permisos:"
ls -ld "$dir" | cut -d' ' -f1

echo "Nombre d'arxius:"
ls -l "$dir" | grep "^-" | wc -l

echo "Nombre de carpetes:"
ls -l "$dir" | grep "^d" | wc -l

echo "Arxius:"
ls -l "$dir" | grep "^-" | awk '{print $9}'

echo "Carpetes:"
ls -l "$dir" | grep "^d" | awk '{print $9}'
