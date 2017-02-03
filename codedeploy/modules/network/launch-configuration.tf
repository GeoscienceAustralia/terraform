resource "aws_launch_configuration" "lc" {
  lifecycle {
    create_before_destroy = true
  }

  image_id      = "${lookup(var.asg_amis, var.region)}"
  instance_type = "${var.instance_type}"

  security_groups = [
    "${aws_security_group.elb_web_inbound_sg.id}",
    "${aws_security_group.app_outbound_sg.id}",
  ]

  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
}

resource "aws_security_group" "app_outbound_sg" {
  # Allow outbound connections
  name = "app_outbound"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.stack_name}_app_outbound"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    created_by  = "terraform"
  }
}
