#!/bin/bash

#echo "$*" = tots els arguments junts: "hola món adeu"
#echo "$@"  = cada argument separat: "hola món" "adeu"

echo "---- Sense cometes dobles ----"
echo "$*"
echo "$@"

echo "---- Amb cometes dobles ----"
echo "\"$*\""
echo "$@"



