#!/bin/bash

positivos=0
negativos=0
ceros=0

for num in "$@"; do # Se cuenta el numero de  argumentos
	if [[ "$num" =~ ^-?[0-9]+$ ]]; then # Comprobación de si es entero
        	if (( num > 0 )); then
            		((positivos++))
       		elif (( num < 0 )); then
            		((negativos++))
        	else
            		((ceros++))
        	fi
   	else
        	echo "'$num' no es un numero valid"
    	fi
done

echo "Nombres positius: $positivos"
echo "Nombres negatius: $negativos"
echo "Nombres iguals a zero: $ceros"
