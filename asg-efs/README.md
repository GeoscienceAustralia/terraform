# Overview

This will create:

 * An autoscaling web server group
 * An EFS file system with mount points across all AZs
 * An elastic load-balancer
 * A VPC with a NAT gateway and a jump host

### Set Variables

Set the following variable in variables.tf:

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

This command will output your ELB address, which you will need below.

### Connecting to ELB

Open a web browser and enter your ELB address. You should see the 'Hello, world!' message.
