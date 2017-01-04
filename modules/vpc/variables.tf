//
// Module: VPC
//

// VPC variables

variable "availability_zones" {
  default = {
      "0" = "ap-southeast-2a"
      "1" = "ap-southeast-2b"
      "2" = "ap-southeast-2c"
  }
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "CIDR for the whole VPC"
}

variable "environment" {
  default = "dev"
  description = "Environment - dev, staging, prod, etc."
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  description = "List of public subnets"
}

variable "private_subnet_cidr" {
  default = ["10.0.51.0/24","10.0.52.0/24","10.0.53.0/24"]
  description = "List of private subnets"
}

variable "db_subnet_cidr" {
  default = ["10.0.21.0/24","10.0.22.0/24","10.0.23.0/24"]
  description = "List of subnets to be used for databases"
}

variable "nat_gw_count" {
    default = "3"
    description = "Number of NAT gateway instances"
}

variable "enable_jumpbox" {
  default = false
  description = "Enable if ssh jumpbox is required"
}

variable "jump_amis" {
    default = {
        "ap-southeast-2" = "ami-4d3b062e"
    }
    description = "AMI to be used for jumpbox"
}

variable "jump_instance_type" {
    default = "t2.nano"
    description = "Instance type to be used for jumpbox"
}

// Variables for providers used in this module

variable "region" {
  default = "ap-southeast-2"
}

variable "stack_name" {}

variable "owner" {}

variable "key_name" {}
