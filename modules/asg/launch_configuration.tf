resource "aws_launch_configuration" "lc" {
  lifecycle {
    create_before_destroy = true
  }

  image_id      = "${lookup(var.asg_amis, var.region)}"
  instance_type = "${var.instance_type}"

  security_groups = [
    "${var.http_inbound_sg_id}",
    "${var.https_inbound_sg_id}",
    "${var.app_ssh_inbound_sg_id}",
    "${var.outbound_sg_id}",
  ]

  user_data                   = "${file(var.userdata_filepath)}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.read_bucket.id}"
}

resource "aws_iam_instance_profile" "read_bucket" {
  name  = "${var.stack_name}_instance_profile"
  roles = ["${var.bucket_name != "0" ? aws_iam_role.s3_readonly_role.name : ""}"]
}

resource "aws_iam_role" "s3_readonly_role" {
  count = "${replace(var.bucket_name, "/^[^0].*/", "1")}"
  name  = "${var.stack_name}_s3_readonly_role"
  path  = "/"

  assume_role_policy = <<EOF
{
  "Version": "2017-01-27",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "arn:aws:s3:::${var.bucket_name}"
    }
  ]

}
EOF
}
