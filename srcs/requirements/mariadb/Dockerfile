FROM debian:buster

ARG WORDPRESS_DB_NAME
ARG WORDPRESS_ADMIN
ARG WORDPRESS_ADMIN_EMAIL
ARG WORDPRESS_ADMIN_PASSWORD
ARG MARIADB_ROOT_PASSWORD

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client \
	tini \
	&& rm -rf /var/lib/apt/lists/*

COPY ./config/my.cnf /etc/mysql/my.cnf
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld

COPY ./tools/init.sh /
RUN chmod +x  init.sh
# RUN chmod +x  /docker-entrypoint-initdb.d/init.sh
# COPY ./tools/init.sql /initdb/
# COPY ./tools/docker-entrypoint.sh /
# RUN chmod 755 docker-entrypoint.sh

WORKDIR /

EXPOSE 3306

ENTRYPOINT ["/usr/bin/tini", "--", "./init.sh"]
