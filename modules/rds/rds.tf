resource "aws_db_instance" "rds" {
  identifier             = "${var.stack_name}-${var.identifier}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
  multi_az               = "${var.rds_is_multi_az}"
  db_subnet_group_name   = "${aws_db_subnet_group.rds-subnet.id}"

  tags {
    Name                 = "${var.stack_name}_elb",
    owner                = "${var.owner}"
    stack_name           = "${var.stack_name}"
    environment          = "${var.environment}"
    created_by           = "terraform"
  }
}

resource "aws_db_subnet_group" "rds-subnet" {
  name                   = "${var.stack_name}_rds_subnet_group"
  description            = "${var.stack_name} RDS Subnet Group"
  subnet_ids             = ["${var.private_subnet_ids}"]
  
  tags {
    Name                 = "${var.stack_name}_elb",
    owner                = "${var.owner}"
    stack_name           = "${var.stack_name}"
    environment          = "${var.environment}"
    created_by           = "terraform"
  }
}
