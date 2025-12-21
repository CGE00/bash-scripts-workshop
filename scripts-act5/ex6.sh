#!/bin/bash

count=0

echo "Introdueix 3 numeros enters:"

until [[ $count -eq 3 ]]; do
    read valor

    if [[ "$valor" =~ ^-?[0-9]+$ ]]; then # Comprobar si es un numero entero
        valors[$count]=$valor
        ((count++))
    else
        echo "Valor no vàlid. Introdueix un numero enter:"
    fi
done

# Separar cada numero
a=${valors[0]}
b=${valors[1]}
c=${valors[2]}

# Calculos
suma=$((a + b + c))
producte=$((a * b * c))

# maximo y minimo
max=$a
min=$a

[[ $b -gt $max ]] && max=$b
[[ $c -gt $max ]] && max=$c

[[ $b -lt $min ]] && min=$b
[[ $c -lt $min ]] && min=$c

echo "Suma: $suma"
echo "Producte: $producte"
echo "Més gran: $max"
echo "Més petit: $min"
