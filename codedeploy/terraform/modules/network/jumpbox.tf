resource "aws_instance" "jumpbox" {
  count = "${var.enable_jumpbox}"

  ami           = "${lookup(var.asg_amis, var.region)}"
  instance_type = "${var.instance_type}"

  tags = {
    Name        = "${var.stack_name}-jumpbox"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    created_by  = "terraform"
  }

  subnet_id                   = "${aws_subnet.public.0.id}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.jump_ssh_sg.id}"]
  key_name                    = "${var.key_name}"
}

resource "aws_eip" "jump" {
  count = "${var.enable_jumpbox}"

  instance = "${aws_instance.jumpbox.id}"
  vpc      = true
}

resource "aws_security_group" "jump_ssh_sg" {
  # Allow SSH to jump host
  name = "jump_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.stack_name}-jump_ssh"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    created_by  = "terraform"
  }
}
