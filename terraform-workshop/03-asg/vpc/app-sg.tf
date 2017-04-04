resource "aws_security_group" "app_http_inbound_sg" {
  # Allow HTTP from within VPC"
  name = "app_http_inbound"

  ingress {
    from_port   = "${var.port_num}"
    to_port     = "${var.port_num}"
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.stack_name}_app_http_inbound"
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
