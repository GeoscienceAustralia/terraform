#!/bin/bash
echo "<h1>Hello World</h1>" > index.html
busybox httpd -f -p 80 &
