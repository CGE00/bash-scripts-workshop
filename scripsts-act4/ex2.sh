#!/bin/bash

read -p "Escriu un numero negatiu: " num

if (( num < 0 )); then
	echo "$num es negatiu"
else
	echo "$num aquest numero no es negatiu"
fi
