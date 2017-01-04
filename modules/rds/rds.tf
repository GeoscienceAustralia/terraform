resource "aws_db_instance" "rds" {
  identifier             = "${var.identifier}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.rds-subnet.id}"
}

resource "aws_db_subnet_group" "rds-subnet" {
  name        = "${var.stack_name}_rds_subnet_group"
  description = "${var.stack_name} RDS Subnet Group"
  subnet_ids = ["${var.private_subnet_ids}"]
}
