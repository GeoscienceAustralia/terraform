resource "aws_launch_configuration" "lc" {
  lifecycle {
    create_before_destroy = true
  }

  image_id      = "${lookup(var.asg_amis, var.region)}"
  instance_type = "${var.instance_type}"

  security_groups = [
    "${aws_security_group.elb_web_inbound_sg.id}",
    "${aws_security_group.app_outbound_sg.id}",
    "${aws_security_group.app_ssh_inbound_sg.id}",
  ]

  user_data                   = "${file(var.start_script)}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.instance_profile.id}"
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

resource "aws_security_group" "app_ssh_inbound_sg" {
  # Allow SSH from within VPC"
  name = "app_ssh_inbound"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.stack_name}_app_ssh_inbound"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    created_by  = "terraform"
  }
}
