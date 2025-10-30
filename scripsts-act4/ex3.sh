#!/bin/bash

read -p "Escriu un numero: " num

if (( num == 0 )); then
	echo "És zero"
else
	echo "No és zero"
fi
