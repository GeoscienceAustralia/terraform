# The Profile we attach to the launch config
resource "aws_iam_instance_profile" "instance_profile" {
  name  = "${var.stack_name}_instance_profile"
  roles = ["${aws_iam_role.instance_role.id}"]
}

# The policy to allow access to the bucket
resource "aws_iam_role_policy" "instance_policy" {
  name = "${var.stack_name}_instance_policy"
  role = "${aws_iam_role.instance_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement":[
    {
      "Action":[
        "autoscaling:Describe*",
        "cloudformation:Describe*",
        "cloudformation:GetTemplate",
        "s3:Get*"
      ],
      "Resource":"*",
      "Effect":"Allow"
    }
  ]
}
EOF
}

# The Role itself
resource "aws_iam_role" "instance_role" {
  name = "${var.stack_name}_instance_role"
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
