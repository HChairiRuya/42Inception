# Base Image
FROM debian:bookworm

# Update and Install Packages
RUN apt update -y && apt install -y \
     vim \
     wget \
     php8.2 \
     php-fpm \
     php-mysql \
     mariadb-client 

RUN mkdir -p /run/php

EXPOSE 9000

# Download WordPress: "file compresser"
RUN wget https://wordpress.org/latest.tar.gz -P /var/www

# on le décompresser 
RUN  cd /var/www && tar -xzvf latest.tar.gz && rm latest.tar.gz

# Install WP-CLI (WordPress Command Line Interface):
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
     && chmod +x wp-cli.phar \
     && mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf

# Copier le script setup_wp_config.sh dans le conteneur
COPY ./tools/setup_wp_config.sh /usr/local/bin/

WORKDIR /run/secrets

# Donner les permissions d'exécution au script
RUN chmod +x /usr/local/bin/setup_wp_config.sh

WORKDIR /var/www/wordpress

# lance php-fpm 
CMD [ "/usr/sbin/php-fpm8.2", "-F" ]

# Exécuter le script au démarrage du conteneur
ENTRYPOINT [ "sh", "/usr/local/bin/setup_wp_config.sh" ]