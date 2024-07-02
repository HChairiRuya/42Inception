# 42 Inception

## Project Overview
Inception is a System Administration project at 42 School that focuses on Docker containerization. 
The goal is to set up a small infrastructure composed of different services under specific rules 
using Docker Compose.

   ![inc](https://github.com/HChairiRuya/42Inception/assets/103891316/31fef047-10bc-45bd-89d3-5b0a9f50a263)


## Table of Contents
- [Requirements](#requirements)
- [Services](#services)
- [Directory Structure](#directory-structure)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)

## Requirements
- Docker
- Docker Compose
- Containers
- Volumes
- Network

## Services
- **NGINX**: Web server with SSL/TLS support
- **WordPress**: CMS with php-fpm
- **MariaDB**: Database server
- **Redis** (bonus): Caching system
- **FTP server** (bonus): File transfer protocol server
- **Static website** (bonus): Simple static website
- **Adminer** (bonus): Managing contents of MySQL databases

## Directory Structure
inception/ <br>
├── Makefile <br>
├── docker-compose.yml <br>
├── .env <br>
├── secrets <br>
└── srcs/ <br>
    ├── requirements/ <br>
    │   ├── nginx/ <br>
    │   ├── wordpress/ <br>
    │   ├── mariadb/ <br>
    │   ├── redis/ <br>
    │   ├── ftp-server/ <br>
    │   ├── adminer/ <br>
    │   └── static-website/ <br>
    └── tools/ <br>


## Configuration
Key configuration files:
- `.env`: Environment variables
- `docker-compose.yml`: Service definitions
- `srcs/requirements/*/Dockerfile`: Individual service configurations
- `srcs/requirements/*/conf/*`: Service-specific configuration files

Important environment variables:
- `DOMAIN_NAME`: Your domain name
- `MYSQL_ROOT_PASSWORD`: MariaDB root password
- `MYSQL_USER`: MariaDB user
- `MYSQL_PASSWORD`: MariaDB user password
- `WORDPRESS_DB_NAME`: WordPress database name

## Troubleshooting
1. **Containers not starting**: 
   - Check logs: `docker-compose logs`
   - Verify port availability

2. **WordPress not connecting to database**:
   - Ensure MariaDB is fully initialized
   - Check database credentials in WordPress configuration

3. **SSL certificate issues**:
   - Verify SSL certificate generation in NGINX container
   - Check NGINX configuration for proper SSL setup

For more detailed troubleshooting, refer to individual service logs:
  docker-compose logs [service_name]

