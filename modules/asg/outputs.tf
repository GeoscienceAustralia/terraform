output "asg_id" {
  value = "${aws_autoscaling_group.asg.id}"
}

output "elb_name" {
  value = "${aws_elb.elb.name}"
}

output "elb_dns_name" {
  value = "${aws_elb.elb.dns_name}"
}

output "webapp_lc_id" {
  value = "${aws_launch_configuration.lc.id}"
}

output "webapp_lc_name" {
  value = "${aws_launch_configuration.lc.name}"
}
