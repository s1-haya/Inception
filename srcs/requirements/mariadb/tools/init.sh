#!/usr/bin/env sh

# service mysql start
mysqld

mariadb -u root -p"$WORDPRESS_ADMIN_PASSWORD" << EOF
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;
GRANT USAGE ON *.* TO '$WORDPRESS_ADMIN'@'%' IDENTIFIED BY '$WORDPRESS_ADMIN_PASSWORD';
GRANT ALL ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_ADMIN'@'%';

FLUSH PRIVILEGES;
EOF

