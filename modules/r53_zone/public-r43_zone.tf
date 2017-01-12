resource "aws_route53_zone" "zone" {
  # Only build if is_public is true
  count = "${var.is_public}"
  name  = "${var.zone}"

  tags {
    name        = "${var.stack_name}_r53_zone"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    terraform   = "true"
  }
}
