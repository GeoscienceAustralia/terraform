provider "aws" {
  region = "${var.region}"
}
module "vpc" {
  source = "../modules/vpc"
  stack_name = "${var.stack_name}"
  owner = "${var.owner}"
  key_name = "${var.key_name}"
  nat_gw_count = "1"
  enable_jumpbox = true
}
