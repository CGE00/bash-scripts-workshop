#!/bin/bash

read -p "Escriu un numero: " num

if (( num > 0 )); then
	echo "$num es positiu"
else
	echo "$num es negatiu"
fi
