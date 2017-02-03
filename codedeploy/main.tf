provider "aws" {
  region = "${var.region}"
}

module "network" {
  source = "./modules/network"

  key_name = "${var.key_name}"

  # The first listener has the health check
  listeners {
    "instance_port"     = "80"
    "instance_protocol" = "HTTP"
    "lb_port"           = "80"
    "lb_protocol"       = "HTTP"
  }

  # Tags
  stack_name  = "${var.stack_name}"
  environment = "${var.environment}"
  owner       = "${var.owner}"
}

module "codedeploy" {
  source = "./modules/codedeploy"

  key_name = "${var.key_name}"

  asg_id   = "${module.network.asg_id}"
  filepath = "${var.filepath}"

  # Tags
  stack_name  = "${var.stack_name}"
  environment = "${var.environment}"
  owner       = "${var.owner}"
}
