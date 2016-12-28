resource "aws_security_group" "jump_ssh_sg" {
  name = "jump_ssh"
  description = "Allow SSH to jump host"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
      Name  = "${var.stack_name}-jump_ssh"
      owner = "${var.owner}"
  }
}

resource "aws_security_group" "ssh_from_jump_sg" {
  name = "ssh_from_jump"
  description = "Allow SSH from jump host(s)"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [
      "${aws_security_group.jump_ssh_sg.id}"
    ]
  }
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
  	  Name  = "${var.stack_name}-ssh_from_jump"
      owner = "${var.owner}"
  }
}
output "ssh_from_jump_sg_id" {
  value = "${aws_security_group.ssh_from_jump_sg.id}"
}
