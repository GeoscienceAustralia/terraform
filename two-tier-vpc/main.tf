provider "aws" {
  region = "${var.region}"
}

terraform {
  required_version = ">= 0.9.1"

  backend "s3" {
    bucket     = "ga-tf-state"
    key        = "twotierstack/"
    region     = "ap-southeast-2"
    lock_table = "terraform"
  }
}

module "vpc" {
  source         = "../modules/vpc"
  stack_name     = "${var.stack_name}"
  environment    = "${var.environment}"
  owner          = "${var.owner}"
  key_name       = "${var.key_name}"
  nat_gw_count   = "1"
  enable_jumpbox = true
}

module "asg" {
  source                = "../modules/asg"
  stack_name            = "${var.stack_name}"
  environment           = "${var.environment}"
  owner                 = "${var.owner}"
  key_name              = "${var.key_name}"
  public_subnet_ids     = "${module.vpc.public_subnet_ids}"
  private_subnet_ids    = "${module.vpc.private_subnet_ids}"
  http_inbound_sg_id    = "${module.vpc.elb_http_inbound_sg_id}"
  https_inbound_sg_id   = "${module.vpc.elb_https_inbound_sg_id}"
  app_ssh_inbound_sg_id = "${module.vpc.app_ssh_inbound_sg_id}"
  outbound_sg_id        = "${module.vpc.elb_outbound_sg_id}"

  listeners {
    "instance_port"     = "80"
    "instance_protocol" = "HTTP"
    "lb_port"           = "80"
    "lb_protocol"       = "HTTP"
  }
}
