# Single instance
> This will create a single ec2 instance in your aws space and create a webpage on it

## Running
1. Check terraform is installed: `terraform version`
1. Check awscli is configured: `aws iam get-user`
1. Validate the terraform files: `terraform plan`
1. Build the ec2: `terraform apply`
1. Browse to the value of public_dns with a browser

## Teardown
1. Destroy the ex2: `terraform destroy`