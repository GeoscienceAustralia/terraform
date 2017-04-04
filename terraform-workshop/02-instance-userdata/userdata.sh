#!/bin/bash

echo 'Hello, world!' > index.html
busybox httpd -f -p 80
