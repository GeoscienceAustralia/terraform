# Overview

This will create:

 * An autoscaling web server group
 * An elastic load-balancer
 * A Postgres database
 * A VPC with a NAT gateway and a jump host

### Set Variables

Set the following variables in variables.tf:

 * db_name - database name
 * username - database username
 * password - database password
 * key_name - the ssh key to be added to your EC2 instances

### Launching

Run these commands for **Terraform**:

1. terraform get
2. terraform plan
3. terraform apply

... or these if your are using **Terragrunt**

1. terragrunt get
2. terragrunt plan
3. terragrunt apply

This command will output your database endpoint, which you will need below.

### Connecting to database

From one of the application servers, you can connect to the database by running:

psql -h <<endpointname>> <<db_name>> <<username>>

For example:

psql -h teststack-mydb-rds.dfk324ljsdf1.ap-southeast-2.rds.amazonaws.com mydb dbadmin
