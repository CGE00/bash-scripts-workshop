#!/bin/bash

fitxer=$1

if [[ -d $1 ]]; then
	echo "Es un directori"
	exit 1
fi

if [[ $1 ]]; then
	echo "Es un fitxer"
	echo "Es un fitxer ${fitxer##*.}"
	exit 1
fi
