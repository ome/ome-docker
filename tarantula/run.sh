#!/bin/bash

/etc/init.d/mysqld start
source /usr/local/rvm/scripts/rvm
# Doesn't work if run as non-root (writes to /etc/init.d)
cd /home/tarantula/rails
cat /home/tarantula/configure-tarantula | \
	RAILS_ENV=production rake tarantula:install
/etc/init.d/httpd start

