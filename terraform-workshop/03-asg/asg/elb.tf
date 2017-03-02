# Single Listener
resource "aws_elb" "elb_one" {
  # if var.listeners.length <= 1
  count   = "${length(var.listeners) <= 1 ? 1 : 0}"
  name    = "${var.stack_name}-elb"
  subnets = ["${var.public_subnet_ids}"]

  listener {
    instance_port     = "${lookup(var.listeners[0],"instance_port","80")}"
    instance_protocol = "${lookup(var.listeners[0],"instance_protocol","HTTP")}"
    lb_port           = "${lookup(var.listeners[0],"lb_port","80")}"
    lb_protocol       = "${lookup(var.listeners[0],"lb_protocol","HTTP")}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 30

    target = "${
      format("%s:%s%s",
      lookup(var.listeners[0],"instance_protocol","HTTP"),
      lookup(var.listeners[0],"instance_port","80"),
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

# Twin listeners
resource "aws_elb" "elb_two" {
  # if var.listeners.length == 2
  count   = "${length(var.listeners) == 2 ? 1 : 0}"
  name    = "${var.stack_name}-elb"
  subnets = ["${var.public_subnet_ids}"]

  listener {
    instance_port     = "${lookup(var.listeners[0],"instance_port","80")}"
    instance_protocol = "${lookup(var.listeners[0],"instance_protocol","HTTP")}"
    lb_port           = "${lookup(var.listeners[0],"lb_port","80")}"
    lb_protocol       = "${lookup(var.listeners[0],"lb_protocol","HTTP")}"
  }

  listener {
    instance_port     = "${lookup(var.listeners[1],"instance_port","80")}"
    instance_protocol = "${lookup(var.listeners[1],"instance_protocol","HTTP")}"
    lb_port           = "${lookup(var.listeners[1],"lb_port","80")}"
    lb_protocol       = "${lookup(var.listeners[1],"lb_protocol","HTTP")}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 30

    target = "${
      format("%s:%s%s",
      lookup(var.listeners[0],"instance_protocol","HTTP"),
      lookup(var.listeners[0],"instance_port","80"),
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
