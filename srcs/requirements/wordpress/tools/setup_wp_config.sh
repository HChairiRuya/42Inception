# #!/bin/bash

# # Attendre que la base de données MariaDB soit prête
sleep 5

# # Vérifier si le fichier wp-config.php existe déjà
if [ ! -f "wp-config.php" ]; then
#     # Créer le fichier de configuration wp-config.php
    wp config create	--allow-root \
        --dbname="TEST_DATABASE" \
        --dbuser="TEST_USER" \
        --dbpass="TEST_PASS" \
        --dbhost="172.17.0.2" --path='/var/www/wordpress'
					
fi
exec "$@"