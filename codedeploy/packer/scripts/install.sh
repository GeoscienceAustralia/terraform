#!/bin/bash

# Install codedeploy
cd /tmp/
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
sudo service codedeploy-agent status