#!/bin/bash


#setup code deploy logs
aws s3 cp s3://aws-codedeploy-ap-southeast-2/latest/install . --region ap-southeast-2
chmod +x ./install
sudo ./install auto

sudo service codedeploy-agent start
sudo service codedeploy-agent status


echo "Deployment in progress." > index.html
busybox httpd -f -p 80 &
