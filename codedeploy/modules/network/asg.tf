resource "aws_autoscaling_group" "asg" {
  lifecycle {
    create_before_destroy = true
  }

  vpc_zone_identifier       = ["${aws_subnet.private.*.id}"]
  name                      = "${var.stack_name}_asg"
  min_size                  = "${var.asg_min}"
  max_size                  = "${var.asg_max}"
  wait_for_elb_capacity     = false
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  load_balancers            = ["${aws_elb.elb_one.name}"]
  health_check_grace_period = "300"
  health_check_type         = "ELB"

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

# Single Listener
resource "aws_elb" "elb_one" {
  # if var.listeners.length <= 1
  count   = "${length(var.listeners) <= 1 ? 1 : 0}"
  name    = "${var.stack_name}-elb"
  subnets = ["${aws_subnet.public.*.id}"]

  listener {
    instance_port     = "${lookup(var.listeners[0],"instance_port","80")}"
    instance_protocol = "${lookup(var.listeners[0],"instance_protocol","HTTP")}"
    lb_port           = "${lookup(var.listeners[0],"lb_port","80")}"
    lb_protocol       = "${lookup(var.listeners[0],"lb_protocol","HTTP")}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 30

    target = "${
      format("%s:%s%s",
      lookup(var.listeners[0],"instance_protocol","HTTP"),
      lookup(var.listeners[0],"instance_port","80"),
      var.elb_check_path)
    }"

    interval = 60
  }

  security_groups = [
    "${aws_security_group.elb_web_inbound_sg.id}",
  ]

  tags {
    Name       = "${var.stack_name}_elb"
    owner      = "${var.owner}"
    stack_name = "${var.stack_name}"
    created_by = "terraform"
  }
}

#
# Scale Up Policy and Alarm
#
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.stack_name}_asg_scale_up"
  scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name                = "${var.stack_name}_high_asg_cpu"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  insufficient_data_actions = []

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.asg.name}"
  }

  alarm_description = "EC2 CPU Utilization"
  alarm_actions     = ["${aws_autoscaling_policy.scale_up.arn}"]
}

#
# Scale Down Policy and Alarm
#
resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.stack_name}_asg_scale_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 600
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name                = "${var.stack_name}_low_asg_cpu"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = "5"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "30"
  insufficient_data_actions = []

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.asg.name}"
  }

  alarm_description = "EC2 CPU Utilization"
  alarm_actions     = ["${aws_autoscaling_policy.scale_down.arn}"]
}

resource "aws_security_group" "elb_web_inbound_sg" {
  name = "elb_web_inbound"

  ingress {
    from_port   = "${var.web_port}"
    to_port     = "${var.web_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.stack_name}_elb_web_inbound"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    created_by  = "terraform"
  }
}

resource "aws_security_group" "elb_outbound_sg" {
  # Allow outbound connections
  name = "elb_outbound"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.stack_name}_elb_outbound"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    created_by  = "terraform"
  }
}
