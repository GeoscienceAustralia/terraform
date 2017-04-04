# Single instance
> This will create a single ec2 instance in your aws space

## Running
1. Check terraform is installed: `terraform version`
1. Check awscli is configured: `aws iam get-user`
1. Modify key_name in variables.tf to be a key in your env that is on your machine.
1. Load the modules: `terraform get`
1. Validate the terraform files: `terraform plan`
1. Build the ec2: `terraform apply`
1. Browse to the elb_dns_name with a browser
1. connect to the jumpbox:
    1. `ssh-add <keyname>`
    1. `ssh -A ubuntu@<ipaddr>`
1. connect to the ec2
    1. login to your aws to find the private ip of your asg ec2
    1. from the jumpbox `ssh ubuntu@<ipaddr>`
## Teardown
1. Destroy the ex2: `terraform destroy`