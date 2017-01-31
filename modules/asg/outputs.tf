output "asg_id" {
  value = "${aws_autoscaling_group.asg.id}"
}

output "elb_name" {
  value = "${aws_elb.elb_one.name}"
}

output "elb_dns_name" {
  value = "${aws_elb.elb_one.dns_name}"
}

output "elb_dns_hosted_zone" {
  value = "${aws_elb.elb_one.zone_id}"
}

output "webapp_lc_id" {
  value = "${aws_launch_configuration.lc.id}"
}

output "webapp_lc_name" {
  value = "${aws_launch_configuration.lc.name}"
}
