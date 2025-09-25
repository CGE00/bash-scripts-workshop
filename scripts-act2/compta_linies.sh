#!/bin/bash

#Christian Godoy Esteoa
#25/09/2025
#Aquest script compta les linies de l'arxiu psswd.

echo "Començant el recompte de línies útils..."

cat /etc/passwd | wc -l | grep -v '^$' > linies.log 2> errors.log
date >> linies.log

echo "Procés completat! Consulta linies.log i errors.log"


