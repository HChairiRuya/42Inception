FROM debian:bookworm

RUN apt update -y && apt install -y \
    vim \
    mariadb-client \
    mariadb-server 

COPY conf/50-server.cnf    /etc/mysql/mariadb.conf.d
COPY ./tools/script_db.sh /usr/local/bin/

EXPOSE 3306

RUN chmod +x /usr/local/bin/script_db.sh

ENTRYPOINT ["sh", "/usr/local/bin/script_db.sh"]