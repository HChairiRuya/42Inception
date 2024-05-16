FROM debian:bookworm

# Install nginx
RUN apt update -y && apt install -y nginx

# Copy the static website files into the Nginx HTML directory
COPY ./website /var/www/html

# Expose port 80 to make the web server accessible
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]