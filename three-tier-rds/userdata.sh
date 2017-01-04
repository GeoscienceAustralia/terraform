#!/bin/bash
echo "Hello World" > index.html
busybox httpd -f -p 80 &
