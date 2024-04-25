#!/bin/bash

service mariadb start;

# Créer la base de données si elle n'existe pas déjà
mysql -e "CREATE DATABASE IF NOT EXISTS \`TEST_DATABASE\`;"

# Créer l'utilisateur si elle n'existe pas déjà
mysql -e "CREATE USER IF NOT EXISTS \`TEST_USER\`@'localhost' IDENTIFIED BY 'TEST_PASS';"

# Accorder tous les privilèges à l'utilisateur sur la base de données
mysql -e "GRANT ALL PRIVILEGES ON \`TEST_DATABASE\`.* TO 'TEST_USER'@'localhost';"

# Appliquer les changements
mysql -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
