//
// Module: ASG
//

// ASG variables

variable "asg_amis" {
    default = {
        "ap-southeast-2" = "ami-4d3b062e"
    }
    description = "AMI to be used in the ASG"
}

variable "instance_type" {
  default = "t2.micro"
  description = "Default instance type"
}

variable "http_inbound_sg_id" {}

variable "https_inbound_sg_id" {}

variable "app_ssh_inbound_sg_id" {}

variable "outbound_sg_id" {}

variable "asg_min" {
    default = "1"
    description = "Minimum number of instances"
}

variable "asg_max" {
    default = "2"
    description = "Maximum number of instances"
}

variable "public_subnet_ids" {
    type = "list"
}

variable "private_subnet_ids" {
    type = "list"
}

// Variables for providers used in this module

variable "region" {
  default = "ap-southeast-2"
}

variable "stack_name" {}

variable "owner" {}

variable "key_name" {}
