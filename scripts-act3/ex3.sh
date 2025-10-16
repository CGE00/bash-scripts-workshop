#!/bin/bash

echo "Escriu una variable global: "
read valglobal

echo "---- Execució de la Comanda ----"
echo `$valglobal`

echo "Valor de retorn de l'última ordre: $?"

echo "---- Arguments del Script ----"
echo "$*"

echo "---- PID of the current Shell ----"
echo "$$"
