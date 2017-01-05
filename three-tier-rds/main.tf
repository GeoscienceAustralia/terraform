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
  private_subnet_ids = "${module.vpc.private_subnet_ids}"
  http_inbound_sg_id = "${module.vpc.elb_http_inbound_sg_id}"
  https_inbound_sg_id = "${module.vpc.elb_https_inbound_sg_id}"
  app_ssh_inbound_sg_id = "${module.vpc.app_ssh_inbound_sg_id}"
  outbound_sg_id = "${module.vpc.elb_outbound_sg_id}"
}

module "rds" {
  source = "../modules/rds"
  stack_name = "${var.stack_name}"
  owner = "${var.owner}"
  vpc_id = "${module.vpc.vpc_id}"
  private_subnet_ids = "${module.vpc.private_subnet_ids}"
  db_name = "${var.db_name}"
  rds_is_multi_az = "${var.rds_is_multi_az}"
  username = "${var.username}"
  password = "${var.password}"
}

module "r53_zone" {
  source = "../modules/r53_zone"
  zone = "${var.stack_name}"
  stack_name = "${var.stack_name}"
  owner = "${var.owner}"
  vpc_id = "${module.vpc.vpc_id}"
}

module "r53_record_db" {
  source = "../modules/r53_record"
  dns_name = "database"
  r53_zone_id = "${module.r53_zone.zone_id}"
  target_hosted_zone_id = "${module.rds.database_hosted_zone_id}"
  target = "${module.rds.database_address}"
  record_type = "alias"

}

module "r53_record_nat" {
  source = "../modules/r53_record"
  dns_name = "nat"
  r53_zone_id = "${module.r53_zone.zone_id}"
  target = "${module.vpc.nat_eip}"
  record_type = "simple"
}
