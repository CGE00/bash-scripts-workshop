#!/bin/bash
# Configuración del servidor remoto
REMOTE_USER="frodriguezh"   # Usuario con el que nos conectaremos por SSH
REMOTE_HOST="10.1.103.203"  # IP del servidor remoto
SSH_PORT=22                 # Puerto SSH

# Función para comprobar e instalar herramientas en el servidor remoto
check_install_tool() {
    local tool=$1   # Guardamos el nombre de la herramienta pasada como parámetro

    # Nos conectamos por SSH y comprobamos si la herramienta existe, si no existe, hacemos apt update e instalamos la herramienta.
    ssh -p $SSH_PORT $REMOTE_USER@$REMOTE_HOST \
    "command -v $tool >/dev/null 2>&1 || sudo apt-get update && sudo apt-get install -y $tool"
}

# Función que ejecuta todas las comprobaciones relacionadas con Apache
run_apache_checks() {
ssh -p $SSH_PORT $REMOTE_USER@$REMOTE_HOST << 'ENDSSH'

echo "=========================="
echo "COMPROVACIONS DEL SERVEI APACHE"
echo "=========================="

# Comprobar si el servicio Apache está activo
echo " Estat del servei:"
systemctl is-active apache2 && echo "apache2: actiu" || echo "apache2: inactiu"
echo

# Comprobar si el puerto 80 está escuchando
echo " Port 80 escoltant:"
ss -tuln | grep ':80 ' || echo "Port 80 no està escoltant"
echo

# Comprobar si la página local responde (localhost)
echo "Pàgina local (127.0.0.1):"
curl -s -o /dev/null -w "%{http_code}\n" http://127.0.0.1
echo

# Comprobar si la página externa responde
echo "Pàgina externa ($REMOTE_HOST):"
curl -s -o /dev/null -w "%{http_code}\n" http://frontal.ies-sabadell.cat
echo

# Mostrar los últimos 10 errores del log de Apache
echo "Logs recents:"
tail -n 10 /var/log/apache2/error.log || echo "No errors found in Apache logs"

ENDSSH
}

# EJECUCIÓN PRINCIPAL DEL SCRIPT

echo "Iniciant comprovacions del servei Apache al servidor $REMOTE_HOST..."

# Comprobamos que las herramientas necesarias están instaladas en el servidor remoto
check_install_tool curl        # Necesario para hacer peticiones HTTP
check_install_tool net-tools   # Necesario para comandos como netstat/ss

# Ejecutamos las comprobaciones de Apache
run_apache_checks

echo "Comprovacions Apache completades!"
