#!/bin/sh

set -e

if [ ! -d /data/mysql/mysql ]; then
	echo "Initializing MySQL database"
	mysql_install_db --datadir=/data/mysql --user=mysql
            chown -R mysql:mysql /data/mysql
fi

exec /usr/libexec/mysqld --basedir=/usr --datadir=/data/mysql --user=mysql --socket=/data/mysql/mysql.sock

