#!/bin/bash

echo "---- Variables Globals ----"
printenv

echo "---- Arguments del Shell ----"
echo "$0"
echo "$3"
echo "$#"
echo "$*"

echo "---- Ultima Ordre Executada ----"
echo "$?"

echo "---- PID de la Shell ----"
echo "$$"

