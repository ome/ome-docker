REVOKE SUPER ON *.* FROM 'tarantula'@'localhost';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root_password');
SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('root_password');
