variable "region" {
  default = "ap-southeast-2"
}

variable "stack_name" {}

variable "owner" {}

variable "asg_amis" {
    default = {
        "ap-southeast-2" = "ami-4d3b062e"
    }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "http_inbound_sg_id" {}

variable "https_inbound_sg_id" {}

variable "outbound_sg_id" {}

variable "asg_min" {
    default = "1"
}

variable "asg_max" {
    default = "2"
}

variable "public_subnet_ids" {
    default = []
}

variable "key_name" {}
