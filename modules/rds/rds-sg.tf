resource "aws_security_group" "rds" {
  name                   = "main_rds_sg"
  description            = "Allow all inbound traffic"
  vpc_id                 = "${var.vpc_id}"

  ingress {
    from_port            = 0
    to_port              = 65535
    protocol             = "TCP"
    cidr_blocks          = ["${var.cidr_blocks}"]
  }

  egress {
    from_port            = 0
    to_port              = 0
    protocol             = "-1"
    cidr_blocks          = ["0.0.0.0/0"]
  }

  tags {
    Name                 = "${var.stack_name}-rds-sg"
    owner                = "${var.owner}"
    stack_name           = "${var.stack_name}"
    environment          = "${var.environment}"
    created_by           = "terraform"
  }
}
