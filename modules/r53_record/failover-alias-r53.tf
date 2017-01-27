resource "aws_route53_health_check" "child" {
  # If health_check_protocol != T* (TCP)
  count             = "${replace(replace(var.health_check_protocol, "/^[^T].*/", "1"), "/^T.*$/", "0")}"
  fqdn              = "${var.target}.${var.target_hosted_zone_id}"
  port              = "${var.health_check_port}"
  type              = "${var.health_check_protocol}"
  resource_path     = "/"
  failure_threshold = "${var.failure_threshold}"
  request_interval  = "${var.request_interval}"

  tags = {
    Name        = "${var.stack_name}_child_health_check"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    terraform   = "true"
  }
}

resource "aws_route53_health_check" "tcp_child" {
  # If health_check_protocol == T* (TCP)
  count             = "${replace(replace(var.health_check_protocol, "/^[^T].*/", "0"), "/^T.*$/", "1")}"
  fqdn              = "${var.target}.${var.target_hosted_zone_id}"
  port              = "${var.health_check_port}"
  type              = "TCP"
  failure_threshold = "${var.failure_threshold}"
  request_interval  = "${var.request_interval}"

  tags = {
    Name        = "${var.stack_name}_tcp_child_health_check"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    terraform   = "true"
  }
}

resource "aws_route53_health_check" "check" {
  type                   = "CALCULATED"
  child_health_threshold = 1

  # If TCP use the TCP health check, otherwise use child.
  child_healthchecks = ["${var.health_check_protocol == "TCP" ? aws_route53_health_check.tcp_child : aws_route53_health_check.child}.id"]

  tags = {
    Name        = "${var.stack_name}_r53_health_check"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    terraform   = "true"
  }
}

resource "aws_route53_record" "failover_alias_route" {
  # if record_type.beginsWith("f")
  count           = "${replace(replace(var.record_type, "/^[^f].*/", "0"), "/^f.*$/", "1")}"
  zone_id         = "${var.r53_zone_id}"
  name            = "${var.dns_name}"
  type            = "A"
  health_check_id = "${aws_route53_health_check.check.id}"
  set_identifier  = "${var.environment}"

  failover_routing_policy {
    type = "${var.failover_policy}"
  }

  alias {
    name                   = "${var.target}"
    zone_id                = "${var.target_hosted_zone_id}"
    evaluate_target_health = true
  }
}
