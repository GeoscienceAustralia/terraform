resource "aws_db_instance" "default" {
  #depends_on             = ["aws_security_group.default"]
  identifier             = "${var.identifier}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${var.rds_sg_id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
}

output "database_address" {
  value = "${aws_db_instance.default.address}"
}

output "database_hosted_zone_id" {
  value = "${aws_db_instance.default.hosted_zone_id}"
}

resource "aws_db_subnet_group" "default" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids = ["${var.private_a_subnet_id}", "${var.private_b_subnet_id}", "${var.private_c_subnet_id}"]
}
