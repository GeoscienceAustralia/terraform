resource "aws_security_group" "jump_ssh_sg" {
# Allow SSH to jump host
  name                        = "jump_ssh"
  ingress {
    from_port                 = 22
    to_port                   = 22
    protocol                  = "tcp"
    cidr_blocks               = ["0.0.0.0/0"]
  }
  egress {
    from_port                 = 0
    to_port                   = 0
    protocol                  = "-1"
    cidr_blocks               = ["0.0.0.0/0"]
  }
  vpc_id                      = "${aws_vpc.vpc.id}"
  tags {
      Name                    = "${var.stack_name}-jump_ssh"
      owner                   = "${var.owner}"
      stack_name              = "${var.stack_name}"
      environment             = "${var.environment}"
      created_by              = "terraform"
  }
}

resource "aws_security_group" "ssh_from_jump_sg" {
# Allow SSH from jump host(s)
  name                        = "ssh_from_jump"
  ingress {
    from_port                 = 22
    to_port                   = 22
    protocol                  = "tcp"
    security_groups = [
      "${aws_security_group.jump_ssh_sg.id}"
    ]
  }
  vpc_id                      = "${aws_vpc.vpc.id}"
  tags {
  	  Name                    = "${var.stack_name}-ssh_from_jump"
      owner                   = "${var.owner}"
      stack_name              = "${var.stack_name}"
      environment             = "${var.environment}"
      created_by              = "terraform"
  }
}
