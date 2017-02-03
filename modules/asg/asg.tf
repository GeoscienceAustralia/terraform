resource "aws_autoscaling_group" "asg" {
  lifecycle {
    create_before_destroy = true
  }

  vpc_zone_identifier   = ["${var.private_subnet_ids}"]
  name                  = "${var.stack_name}_${aws_launch_configuration.lc.name}_asg"
  min_size              = "${var.asg_min}"
  max_size              = "${var.asg_max}"
  wait_for_elb_capacity = false
  force_delete          = true
  launch_configuration  = "${aws_launch_configuration.lc.name}"
  load_balancers        = ["${coalesce(join("",aws_elb.elb_one.*.name),join("",aws_elb.elb_two.*.name))}"]

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
