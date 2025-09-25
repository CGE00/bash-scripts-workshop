#!/bin/bash

#Christian Godoy Esteoa
#25/09/2025
#Aquest script compta les linies de l'arxiu psswd i si hi ha errors ho pasa a l arxiu errors.log.

echo "Començant el recompte de línies útils..."

cat /etc/passwd | grep -v '^$'| wc -l > linies.log 2> errors.log
date >> linies.log

echo "Procés completat! Consulta linies.log i errors.log"


