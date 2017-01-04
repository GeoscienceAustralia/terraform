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

module "asg" {
  source = "../modules/asg"
  stack_name = "${var.stack_name}"
  owner = "${var.owner}"
  key_name = "${var.key_name}"
  public_subnet_ids = "${module.vpc.public_subnet_ids}"
  http_inbound_sg_id = "${module.vpc.elb_http_inbound_sg_id}"
  https_inbound_sg_id = "${module.vpc.elb_https_inbound_sg_id}"
  outbound_sg_id = "${module.vpc.elb_outbound_sg_id}"
}

module "rds" {
  source = "../modules/rds"
  stack_name = "${var.stack_name}"
  owner = "${var.owner}"
  vpc_id = "${module.vpc.vpc_id}"
  private_subnet_ids = "${module.vpc.private_subnet_ids}"
}

output "elb_dns_name" {
  value = "${module.asg.elb_dns_name}"
}
