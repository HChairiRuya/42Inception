# Specify the base image
FROM debian:buster 

# Update package lists
RUN apt update && apt install -y \
    openssl \
    curl \
    vim \
    nginx

# Create SSL directory (if not created)
RUN mkdir -p /etc/nginx/ssl

# Generate SSL certificate and key without a password
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MR/ST=IDF/L=TETOUAN/O=1337/OU=1337/CN=hchairi.42.fr/UID=hchairi"

# Copy your custom NGINX configuration file
COPY ./conf/nginx.conf /etc/nginx/conf.d/

# Expose port 80 for HTTP traffic (you can also expose 443 for HTTPS if needed)
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]