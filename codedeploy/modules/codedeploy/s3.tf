resource "aws_s3_bucket" "bucket" {
  bucket = "${var.stack_name}-${var.environment}-codedeploy"
  acl    = "private"

  tags {
    Name       = "${var.stack_name}_elb"
    owner      = "${var.owner}"
    stack_name = "${var.stack_name}"
    created_by = "terraform"
  }
}
