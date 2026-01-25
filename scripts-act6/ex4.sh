!/bin/bash

USG_ERR=7 #codi d'error per cualsevol error durant el script

max_dos ( ) { #creació de la funció max_dos
    if [ "$1" -eq "$2" ] ; then
        echo 'Iguals'
        exit 0 #si són iguals, mostra *Iguals* i surt del programa
    elif [ "$1" -gt "$2" ] ; then
        ret_val=$1
    else
        ret_val=$2
    fi #si no, guarda a ret_val el número més gran
}

err_str ( ) { #cració de la funció err_str
    echo "Ús: $0 <numero1>  <numero2>"
    exit $USG_ERR
} #mostra el missatge d us correcte i surt amb codi d error USG_ERR
NUM_1=$1
NUM_2=$2

if [ $# -ne 2 ] ; then #comprovació de que el nombre de paràmetres siguin 2
    err_str

#comprovació de que NUM_1 sigui un numero
elif [ `expr $NUM_1 : '[0-9]*'` -eq ${#NUM_1} ] ; then

    #comprovació de que NUM_1 sigui un numero
    if [ `expr $NUM_2 : '[0-9]*'` -eq ${#NUM_2} ] ; then

        max_dos $NUM_1 $NUM_2 #crida a la funció que calcula el màxim

        echo $ret_val #mostra el resultat guardat a ret_val
    else
        err_str
    fi
else
    err_str
NUM_1=$1
NUM_2=$2

if [ $# -ne 2 ] ; then #comprovació de que el nombre de paràmetres siguin 2
    err_str

#comprovació de que NUM_1 sigui un numero
elif [ `expr $NUM_1 : '[0-9]*'` -eq ${#NUM_1} ] ; then

    #comprovació de que NUM_1 sigui un numero
    if [ `expr $NUM_2 : '[0-9]*'` -eq ${#NUM_2} ] ; then

        max_dos $NUM_1 $NUM_2 #crida a la funció que calcula el màxim

        echo $ret_val #mostra el resultat guardat a ret_val
    else
        err_str
    fi
else
    err_str
