resource "aws_elb" "elb" {
  name    = "${var.stack_name}-elb"
  subnets = ["${var.public_subnet_ids}"]

  listener {
    instance_port     = "${var.port_num}"
    instance_protocol = "${var.elb_protocol}"
    lb_port           = "${var.port_num}"
    lb_protocol       = "${var.elb_protocol}"
  }

  listener {
    instance_port     = "${var.port_num_two}"
    instance_protocol = "${var.elb_protocol_two}"
    lb_port           = "${var.port_num_two}"
    lb_protocol       = "${var.elb_protocol_two}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 30

    # HTTP:80/
    target   = "${format("%s:%s%s",var.elb_protocol,var.port_num,var.elb_check_path)}"
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
