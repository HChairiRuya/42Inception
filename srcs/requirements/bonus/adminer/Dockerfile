FROM php:7
# Update packages and install wget
RUN apt update && apt install -y wget

# Install PHP extensions required by Adminer
RUN docker-php-ext-install mysqli pdo_mysql

# Create directory for Adminer
RUN mkdir -p /var/www/html

# Download Adminer
RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

# Expose port 8080
EXPOSE 8080

# Set working directory
WORKDIR /var/www/html

# Rename adminer.php to index.php
RUN mv adminer.php index.php

# Command to start PHP built-in web server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]