resource "aws_route53_zone" "zone" {
  name              = "${var.zone}"
  vpc_id            = "${var.vpc_id}"
  tags {
    name            = "${var.stack_name}_r53_zone"
    owner           = "${var.owner}"
    stack_name      = "${var.stack_name}"
    environment     = "${var.environment}"
    terraform       = "true"
  }

}
