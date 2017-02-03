# Overview

This will create:

 * An autoscaling web server group
 * An elastic load-balancer
 * A VPC with a NAT gateway
 * A CodeDeploy app
 * An s3 bucket with an example CodeDeloy Release

### Set Variables

Set the following variable in variables.tf:

 * key_name - the ssh key to be added to your EC2 instances
 * stack_name - the name of this application

### Launching

Run these commands for **Terraform**:

1. terraform get
2. terraform plan
3. terraform apply

... or these if your are using **Terragrunt**

1. terragrunt get
2. terragrunt plan
3. terragrunt apply

### Deploy Release
After you have built the infrastructure, you will need to deploy the app
```
aws deploy push --application-name codedeploy-dev \
--s3-location 