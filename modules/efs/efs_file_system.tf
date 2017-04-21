resource "aws_efs_file_system" "efs" {
  tags {
    Name        = "${var.stack_name}_efs"
    owner       = "${var.owner}"
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
  }
}