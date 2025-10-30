#!/bin/bash

#Per comprovar que siguin 3 arguments
if [[ $# != 3 ]]; then
	echo "Error amb els arguments"
	echo "Forma correcta: $0 [operació] [argument1] [argument2]"
	exit 1
fi

operacio=$1
arg1=$2
arg2=$3

#Per comprovar que els arguments siguin valids
if (( arg1 + 0 )) 2>/dev/null; then
	echo "L'argument1 es numero"
else
	echo "L'argument1 no es un numero"
	exit 1
fi

if (( arg2 + 0 )) 2>/dev/null; then
        echo "L'argument2 es numero"
else
        echo "L'argument2 no es un numero"
        exit 1
fi

#Per comprovar que sigui una operació correcta
if [[ $operacio != "add" && $operacio != "subtract" && $operacio != "multiply" && $operacio != "divide" ]]; then
	echo "L'operació no es valida"
	exit 1
fi


#Fer les operacions
if [[ $operacio == "add" ]]; then
    resultat=$((arg1 + arg2))
elif [[ $operacio == "subtract" ]]; then
    resultat=$((arg1 - arg2))
elif [[ $operacio == "multiply" ]]; then
    resultat=$((arg1 * arg2))
elif [[ $operacio == "divide" ]]; then
    resultat=$((arg1 / arg2))
fi

echo "Resultat: $resultat"
