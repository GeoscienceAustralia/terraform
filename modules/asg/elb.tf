# Single Listener
resource "aws_elb" "elb" {
  name    = "${var.stack_name}-elb"
  subnets = ["${var.public_subnet_ids}"]

  listener {
    instance_port     = "${lookup(var.listeners,"instance_port","80")}"
    instance_protocol = "${lookup(var.listeners,"instance_protocol","HTTP")}"
    lb_port           = "${lookup(var.listeners,"lb_port","80")}"
    lb_protocol       = "${lookup(var.listeners,"lb_protocol","HTTP")}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 30

    target = "${
      format("%s:%s%s",
      lookup(var.listeners,"instance_protocol","HTTP"),
      lookup(var.listeners,"instance_port","80"),
      var.elb_check_path)
    }"

    interval = 60
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
