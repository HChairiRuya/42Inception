#!/bin/bash

# Attendre que la base de données MariaDB soit prête
sleep 2

# Vérifier si le fichier wp-config.php existe déjà
if [ ! -f "wp-config.php" ]; then
    # Créer le fichier de configuration wp-config.php
    wp config create \
    --dbname=TEST_DATABASE \
    --dbuser=TEST_USER \
    --dbpass=TEST_PASS \
    --dbhost=mariadb \
    --dbprefix=wp_ --skip-check
fi

exec "$@" 