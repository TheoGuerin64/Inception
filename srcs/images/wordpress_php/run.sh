if [ ! -f "/home/wordpress/index.php" ]; then
	echo "Wait for mariadb to start..."
	while ! mysqladmin ping -h mariadb --silent; do
		sleep 1
	done

	cd /home/wordpress
	wp core download 
	wp config create --dbname=wordpress --dbuser=$MARIADB_ADMIN_NAME --dbpass=$MARIADB_ADMIN_PASS --dbhost=mariadb
	wp core install --url=localhost --title=Inception --admin_user=$WORDPRESS_ADMIN_NAME --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_MAIL --skip-email
	wp user create --user_pass=$WORDPRESS_USER_PASS $WORDPRESS_USER_NAME $WORDPRESS_USER_MAIL
fi

exec php-fpm8 -F
