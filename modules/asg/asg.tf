resource "aws_autoscaling_group" "asg" {
  lifecycle {
    create_before_destroy = true
  }

  vpc_zone_identifier   = ["${var.private_subnet_ids}"]
  name                  = "${var.stack_name}_asg"
  min_size              = "${var.asg_min}"
  max_size              = "${var.asg_max}"
  wait_for_elb_capacity = false
  force_delete          = true
  launch_configuration  = "${aws_launch_configuration.lc.name}"
  load_balancers        = ["${aws_elb.elb.name}"]

  tag {
    key                 = "Name"
    value               = "${var.stack_name}_asg"
    propagate_at_launch = "true"
  }

  tag {
    key                 = "owner"
    value               = "${var.owner}"
    propagate_at_launch = "true"
  }

  tag {
    key                 = "environment"
    value               = "${var.environment}"
    propagate_at_launch = "true"
  }

  tag {
    key                 = "stack_name"
    value               = "${var.stack_name}"
    propagate_at_launch = "true"
  }

  tag {
    key                 = "created_by"
    value               = "terraform"
    propagate_at_launch = "true"
  }
}

resource "aws_lifecycle_hook" "initial_hook" {
  name                   = "${var.stack_name}_initial_hook"
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
  default_result         = "CONTINUE"
  heartbeat_timeout      = 2000
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_LAUNCHING"

  notification_metadata = <<EOF
{
  "foo": "bar"
}
EOF

  notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
  role_arn                = "arn:aws:iam::123456789012:role/S3Access"
}
