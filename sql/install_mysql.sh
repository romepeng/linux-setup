#!/bin/bash

# ubuntu install mysql8.0

sudo apt update -y
sudo apt install mysql-server
sudo systemctl start mysql.service
sudo mysql_secure_installation
sudo mysql -u root -p

# change root password
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'yournewpassword';
CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
ALTER USER 'sammy'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT PRIVILEGE ON database.table TO 'username'@'host';


FLUSH PRIVILEGES;
sudo mysqladmin -p -u sammy version
