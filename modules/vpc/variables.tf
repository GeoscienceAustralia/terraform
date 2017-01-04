variable "region" {
  default = "ap-southeast-2"
}

variable "stack_name" {}

variable "owner" {}

variable "availability_zones" {
  default = {
      "0" = "ap-southeast-2a"
      "1" = "ap-southeast-2b"
      "2" = "ap-southeast-2c"
  }
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

variable "environment" {
  default = "dev"
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.51.0/24","10.0.52.0/24","10.0.53.0/24"]
}

variable "db_subnet_cidr" {
  default = ["10.0.21.0/24","10.0.22.0/24","10.0.23.0/24"]
}

variable "nat_gw_count" {
    default = "3"
}

variable "enable_jumpbox" {
  default = false
}

variable "jump_amis" {
    default = {
        "ap-southeast-2" = "ami-4d3b062e"
    }
}

variable "jump_instance_type" {
    default = "t2.nano"
}

variable "key_name" {}