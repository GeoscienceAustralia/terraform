#!/bin/bash

# Update
sudo apt-get update

# Install apache
sudo apt-get install -y apache2
sudo apt-get install -y apache2-utils

# Copy index
sudo mv /tmp/index.html /var/www/html/index.html

# Restart service
sudo service apache2 restart
