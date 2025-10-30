#!/bin/bash

[[ -f $1 ]] && echo "Es un fitxer"

[[ -r $1 ]] && echo "Es llegible"

[[ -w $1 ]] && echo "Es editable"

[[ -x $1 ]] && echo "Es executable"
