resource "aws_elb" "elb" {
  name    = "${var.stack_name}-elb"
  subnets = ["${var.public_subnet_ids}"]

  listener {
    instance_port     = "${var.port_num}"
    instance_protocol = "http"
    lb_port           = "${var.port_num}"
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 30
    target              = "HTTP:${var.port_num}/"
    interval            = 60
  }

  security_groups = [
    "${var.http_inbound_sg_id}",
    "${var.https_inbound_sg_id}",
  ]

  tags {
    Name       = "${var.stack_name}_elb"
    owner      = "${var.owner}"
    stack_name = "${var.stack_name}"
    created_by = "terraform"
  }
}
