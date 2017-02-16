# Overview

This will create:

 * An autoscaling web server group
 * An elastic load-balancer
 * A VPC with a NAT gateway
 * A CodeDeploy app

### Required
 * A space you have control over
 * A bucket to store your releases in

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
After you have built the infrastructure, you will need to create a revision
```
aws deploy push --application-name codedeploy-dev \
--s3-location s3://<yourbucketname>/SampleApp.zip \
--source ./files/SampleApp_Linux
```

Then deploy the app 
```
aws deploy create-deployment --application-name codedeploy-dev \
--s3-location bucket=<yourbucketname>,key=SampleApp.zip,bundleType=zip,eTag=<get this number from the command above> \
--deployment-group-name create \
--deployment-config-name CodeDeployDefault.OneAtATime \
--description "test"
```