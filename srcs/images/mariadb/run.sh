if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --datadir=/var/lib/mysql --skip-test-db > /dev/null

	mariadbd --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE USER $MARIADB_ADMIN_NAME@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASS';
GRANT ALL PRIVILEGES ON *.* TO $MARIADB_ADMIN_NAME@'%' WITH GRANT OPTION;
CREATE DATABASE wordpress;
USE wordpress;
FLUSH PRIVILEGES;
EOF
fi

exec mariadbd
