resource "aws_route53_zone" "zone" {
  # Only build if is_public is false
  count  = "${var.is_public ? 0 : 1}"
  name   = "${var.zone}"
  vpc_id = "${var.vpc_id}"

  tags {
    name        = "${var.stack_name}_r53_zone"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    terraform   = "true"
  }
}
