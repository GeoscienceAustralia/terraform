//
// Module: EFS
//

// EFS variables

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

variable "vpc_id" {}

variable "private_subnet_ids" {
  type = "list"
}

variable "stack_name" {}

variable "environment" {}

variable "owner" {}

variable "app_sg_id" {}
