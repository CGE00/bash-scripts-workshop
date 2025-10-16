#!/bin/bash

echo "---- Informe del sistema ----"
echo	#Salt de línia

echo "Usuari (\$USER): $USER"
echo "whoami: $(whoami)"
echo

echo "Directori personal (\$HOME): $HOME"
echo "Directori actual (\$PWD): $PWD"
echo

echo "Contingut del directori actual (ls -1):"
ls -1
ls_status=$?
echo

count=$(ls -1 | wc -l)
count_status=$?
echo "Quants elements hi ha en aquest directori: $count"
echo

echo "PID del shell ($$)"

echo "Codi de retorn de l'última ordre (\$?) : $count_status"


