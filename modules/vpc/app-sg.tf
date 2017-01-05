resource "aws_security_group" "app_http_inbound_sg" {
  name = "app_http_inbound"
  description = "Allow HTTP from within VPC"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
      Name = "${var.stack_name}_app_http_inbound",
      owner = "${var.owner}"
  }
}

resource "aws_security_group" "app_ssh_inbound_sg" {
  name = "app_ssh_inbound"
  description = "Allow SSH from within VPC"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
      Name = "${var.stack_name}_app_ssh_inbound",
      owner = "${var.owner}"
  }
}

resource "aws_security_group" "app_outbound_sg" {
  name = "app_outbound"
  description = "Allow outbound connections"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
      Name = "${var.stack_name}_app_outbound",
      owner = "${var.owner}"
  }
}
