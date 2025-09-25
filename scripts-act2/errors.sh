#!/bin/bash

cat /no_existeix 2> errors.log
echo "Alguna cosa ha fallat! Revisa errors.log"
