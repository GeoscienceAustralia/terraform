# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file
# except in compliance with the License. A copy of the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed on an "AS IS"
# BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under the License.
variable "ip_range" {
  default = "0.0.0.0/0" # Change to your IP Range!
}
variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}
variable "private_a_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}
variable "private_b_subnet_cidr" {
  description = "CIDR for the second Private Subnet"
  default = "10.0.2.0/24"
}
variable "private_c_subnet_cidr" {
  description = "CIDR for the second Private Subnet"
  default = "10.0.3.0/24"
}

#
# From other modules
#
variable "availability_zones" {
  type = "list"
}
variable "key_name" {}
variable "region" {}