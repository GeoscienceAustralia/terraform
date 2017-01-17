#!/bin/bash
sudo apt-get install -y postgresql-client

echo "Hello World" > index.html
busybox httpd -f -p 80 &
