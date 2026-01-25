!/bin/bash

if [[ -n "$1" ]]; then
    host="$1"
else
    echo "IP del servidor SSH:"
    read host
fi

echo "Nom d'usuari per connectar a $host:"
read usuari

echo "Connectant a $usuari@$host i executant comandes..."

ssh "$usuari@$host" <<EOF
echo "===== Informació del sistema remot ====="
hostname
uname -a

echo
echo "===== Directori actual ====="
pwd

echo
echo "===== Llistat d'arxius ====="
ls -l

echo
echo "===== Ús de disc ====="
df -h

echo
echo "===== Fi de l'execució remota ====="
EOF
