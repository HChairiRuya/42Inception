# #!/bin/bash

# Vérifier si le fichier wp-config.php existe déjà
if [ ! -f "wp-config.php" ]; then
    echo "Creating wp-config.php..."
# Créer le fichier de configuration wp-config.php
	wp config create --allow-root \
        --dbname="TEST_DATABASE" \
        --dbuser="TEST_USER" \
        --dbpass="TEST_PASS" \
        --dbhost="172.17.0.2:3306" --path='/var/www/wordpress'				
fi
exec "$@"

#!/bin/sh

#check if wp-config.php exist
# if [ -f ./wp-config.php ]
# then
# 	echo "wordpress already downloaded"
# else
# 	sleep 5
# 	wp config create --allow-root \
#         --dbname="TEST_DATABASE" \
#         --dbuser="TEST_USER" \
#         --dbpass="TEST_PASS" \
#         --dbhost="172.17.0.2:3306" --path='/var/www/wordpress'


# fi

# exec "$@"