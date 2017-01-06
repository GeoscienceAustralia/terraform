
#
# Scale Up Policy and Alarm
#
resource "aws_autoscaling_policy" "scale_up" {
  name                         = "${var.stack_name}_asg_scale_up"
  scaling_adjustment           = 2
  adjustment_type              = "ChangeInCapacity"
  cooldown                     = 300
  autoscaling_group_name       = "${aws_autoscaling_group.asg.name}"
}
resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name                   = "${var.stack_name}_high_asg_cpu"
  comparison_operator          = "GreaterThanThreshold"
  evaluation_periods           = "2"
  metric_name                  = "CPUUtilization"
  namespace                    = "AWS/EC2"
  period                       = "120"
  statistic                    = "Average"
  threshold                    = "80"
  insufficient_data_actions    = []
  dimensions {
      AutoScalingGroupName     = "${aws_autoscaling_group.asg.name}"
  }
  alarm_description            = "EC2 CPU Utilization"
  alarm_actions                = ["${aws_autoscaling_policy.scale_up.arn}"]
}

#
# Scale Down Policy and Alarm
#
resource "aws_autoscaling_policy" "scale_down" {
  name                         = "${var.stack_name}_asg_scale_down"
  scaling_adjustment           = -1
  adjustment_type              = "ChangeInCapacity"
  cooldown                     = 600
  autoscaling_group_name       = "${aws_autoscaling_group.asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name                   = "${var.stack_name}_low_asg_cpu"
  comparison_operator          = "LessThanThreshold"
  evaluation_periods           = "5"
  metric_name                  = "CPUUtilization"
  namespace                    = "AWS/EC2"
  period                       = "120"
  statistic                    = "Average"
  threshold                    = "30"
  insufficient_data_actions    = []
  dimensions {
      AutoScalingGroupName     = "${aws_autoscaling_group.asg.name}"
  }
  alarm_description            = "EC2 CPU Utilization"
  alarm_actions                = ["${aws_autoscaling_policy.scale_down.arn}"]
}
