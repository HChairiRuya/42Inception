# Base Image
FROM debian:bookworm 

# Update and Install Packages
RUN apt update && apt install -y \
    openssl \
    curl \
    vim \
    nginx

# Create SSL directory (if not created)
RUN mkdir -p /etc/nginx/ssl

# Generate SSL certificate and key without a password
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MR/ST=IDF/L=TETOUAN/O=1337/OU=1337/CN=hchairi.42.fr/UID=hchairi"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# remove the default nginx conf file
RUN rm -rf /etc/nginx/sites-enabled/*

EXPOSE 443

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]