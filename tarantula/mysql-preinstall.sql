DELETE FROM mysql.user WHERE host NOT IN ('localhost', '127.0.0.1') OR user = '';
DELETE FROM mysql.db WHERE db LIKE 'test%';
-- Tarantula install will create a database, so just grant privileges
-- CREATE DATABASE tarantula DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
GRANT ALL ON tarantula.* TO 'tarantula'@'localhost' IDENTIFIED BY 'tarantula';
-- Tarantula install and runtime requires SUPER privilege
GRANT SUPER ON *.* TO 'tarantula'@'localhost';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root_password');
SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('root_password');
