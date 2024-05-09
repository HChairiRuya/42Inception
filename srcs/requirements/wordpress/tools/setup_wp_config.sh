# #!/bin/bash

# Vérifier si le fichier wp-config.php existe déjà
if [ ! -f "wp-config.php" ]; then
    echo "Creating wp-config.php..."
# Créer le fichier de configuration wp-config.php
    sleep 5
	wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASS \
        --dbhost="mariadb:3306" --path='/var/www/wordpress'

        wp core install --allow-root \
        --url=$URL \
        --title=$TITTLE \
        --admin_user=$ADMIN_USER \
        --admin_password=$ADMIN_PASS \
        --admin_email=$ADMIN_EMAIL

        wp user create --allow-root \
        $USER_TWO $USER_TWO_EMAIL \
        --user_pass=$USER_TWO_PASS

        echo "Wordpress Configured Successfully!"
fi
exec "$@"