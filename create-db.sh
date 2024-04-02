#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root" 
   exit 1
fi

generate_password() {
    openssl rand -base64 12 | tr -dc 'a-zA-Z0-9' | head -c 16
}

if ! command -v mysql &> /dev/null; then
    echo "Installation de MariaDB..."
    apt-get update
    apt-get install -y mariadb-server
fi

if [ -z "$1" ]; then
    read -p "Veuillez entrer le nom du projet : " project_name
else
    project_name="$1"
fi

user_password=$(generate_password)

mysql -e "CREATE DATABASE IF NOT EXISTS $project_name;"
mysql -e "CREATE USER IF NOT EXISTS '$project_name'@'localhost' IDENTIFIED BY '$user_password';"
mysql -e "GRANT ALL PRIVILEGES ON $project_name.* TO '$project_name'@'localhost';"

echo "Base de données '$project_name' créée avec succès."
echo "Utilisateur '$project_name' créé avec le mot de passe : $user_password"