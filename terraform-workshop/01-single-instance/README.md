# Single instance
> This will create a single ec2 instance in your aws space

## Running
1. Check terraform is installed: `terraform version`
1. Check awscli is configured: `aws iam get-user`
1. Validate the terraform files: `terraform plan`
1. Build the ec2: `terraform apply`

## Teardown
1. Destroy the ec2 `terraform destroy`