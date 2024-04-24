FROM debian:bookworm

RUN apt update -y && apt install -y \
    mariadb-client \
    mariadb-server

COPY conf/50-server.cnf    /etc/mysql/mariadb.conf.d/50-server.cnf