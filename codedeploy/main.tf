provider "aws" {
  region = "${var.region}"
}

module "network" {
  source = "./modules/network"

  asg_amis = {
    "ap-southeast-2" = "${var.ami_id}"
  }

  key_name       = "${var.key_name}"
  enable_jumpbox = "1"

  # The first listener has the health check
  listeners {
    "instance_port"     = "80"
    "instance_protocol" = "HTTP"
    "lb_port"           = "80"
    "lb_protocol"       = "HTTP"
  }

  # Tags
  stack_name   = "${var.stack_name}"
  environment  = "${var.environment}"
  owner        = "${var.owner}"
  start_script = "${var.filepath}"
}

module "codedeploy" {
  source = "./modules/codedeploy"

  key_name = "${var.key_name}"

  asg_id = "${module.network.asg_id}"

  # Tags
  stack_name  = "${var.stack_name}"
  environment = "${var.environment}"
  owner       = "${var.owner}"
}
