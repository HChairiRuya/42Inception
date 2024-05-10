#!/bin/bash

DB_PASS_CONTENT=$(shell cat ./secrets/db_password.txt)

service mariadb start;

# Créer la base de données si elle n'existe pas déjà
mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"

# Créer l'utilisateur si elle n'existe pas déjà
mysql -e "CREATE USER IF NOT EXISTS \`$DB_USER\`@'%' IDENTIFIED BY '$DB_PASS_CONTENT';"

# Accorder tous les privilèges à l'utilisateur sur la base de données
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS_CONTENT';"

# Appliquer les changements
mysql -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
# cmd qui restart mariadb in forground after killed in background