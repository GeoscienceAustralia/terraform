# AWS Variables
variable "region" {
  default = "ap-southeast-2"
}

variable "availability_zones" {
  default = {
    "0" = "ap-southeast-2a"
    "1" = "ap-southeast-2b"
    "2" = "ap-southeast-2c"
  }
}

# elb
variable "elb_check_path" {
  default = "/"
}

variable "listeners" {
  type = "list"
}

variable "web_port" {
  default = "80"
}

# ASG
variable "asg_amis" {
  default = {
    "ap-southeast-2" = "ami-4d3b062e"
  }

  description = "AMI to be used in the ASG"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Default instance type"
}

variable "asg_min" {
  default     = "1"
  description = "Minimum number of instances"
}

variable "asg_max" {
  default     = "2"
  description = "Maximum number of instances"
}

# VPC variables
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR for the whole VPC"
}

variable "public_subnet_cidr" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "List of public subnets"
}

variable "private_subnet_cidr" {
  default     = ["10.0.51.0/24", "10.0.52.0/24", "10.0.53.0/24"]
  description = "List of private subnets"
}

variable "nat_gw_count" {
  default     = "1"
  description = "Number of NAT gateway instances"
}

variable "key_name" {}

#Tags
variable "stack_name" {}

variable "environment" {}

variable "owner" {}
