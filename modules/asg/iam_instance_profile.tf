# The Profile we attach to the launch config
resource "aws_iam_instance_profile" "read_bucket" {
  name  = "${var.stack_name}_instance_profile"
  roles = ["${aws_iam_role.s3_readonly_role.id}"]
}

# The policy to allow access to the bucket
resource "aws_iam_role_policy" "s3_readonly_policy" {
  count = "${replace(var.bucket_name, "/^[^0].*/", "1")}"
  name  = "${var.stack_name}_s3_policy"
  role  = "${aws_iam_role.s3_readonly_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# The Role itself
resource "aws_iam_role" "s3_readonly_role" {
  name = "${var.stack_name}_s3_readonly_role"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
