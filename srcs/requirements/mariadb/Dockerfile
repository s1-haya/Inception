FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /

EXPOSE 3306

CMD ["mysqld_safe"]