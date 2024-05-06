# #!/bin/bash

# Vérifier si le fichier wp-config.php existe déjà
if [ ! -f "wp-config.php" ]; then
    echo "Creating wp-config.php..."
# Créer le fichier de configuration wp-config.php
	wp config create --allow-root \
        --dbname="TEST_DATABASE" \
        --dbuser="TEST_USER" \
        --dbpass="TEST_PASS" \
        --dbhost="mariadb:3306" --path='/var/www/wordpress'

        wp core install --allow-root \
        --url="TEST_URL" \
        --title="TEST_TITLE" \
        --admin_user="TEST_ADMIN_USER" \
        --admin_password="TEST_ADMIN_PASS" \
        --admin_email="TEST_ADMIN_EMAIL"

        # wp user create --allow-root \
        # $WP_SECOND_USER \
        # $WP_SECOND_USER_MAIL \
        # --user_pass=$WP_SECOND_USER_PASS
fi
exec "$@"