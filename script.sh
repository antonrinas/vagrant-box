#!/bin/bash

# Updating repository

sudo apt-get -y update

# Installing Apache

sudo apt-get -y install apache2

# Installing MySQL. Also, setting up root password for MySQL as it will prompt to enter the password during installation

sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password rootpass'
sudo apt-get -y install mysql-server

# Installing PHP
sudo apt-get -y install php7.2
sudo apt-get -y install php-bcmath php7.2-ctype php7.2-json php7.2-mbstring openssl php7.2-mysql php7.2-tokenizer php7.2-xml

# Add Apache2 virtual host config
sudo cp /vagrant/vagrant-test.conf /etc/apache2/sites-available/vagrant-test.conf
# Enable new config
sudo a2ensite vagrant-test.conf
# Restart Apache2
sudo service apache2 restart
# Enable Apache2 mod_rewrite
sudo a2enmod rewrite
# Restart Apache2
sudo service apache2 restart