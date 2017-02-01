output "asg_id" {
  value = "${aws_autoscaling_group.asg.id}"
}

output "elb_name" {
  value = "${aws_elb.elb_one.name}"
}

output "elb_dns_name" {
  # Return the dns_name of whichever elb was created
  value = "${coalesce(
    join("", aws_elb.elb_one.*.dns_name),
    join("",  aws_elb.elb_two.*.dns_name)
  )}"
}

output "elb_dns_hosted_zone" {
  # Return the zone_id of whichever elb was created
  value = "${coalesce(
    join("", aws_elb.elb_one.*.zone_id),
    join("",  aws_elb.elb_two.*.zone_id)
  )}"
}

output "webapp_lc_id" {
  value = "${aws_launch_configuration.lc.id}"
}

output "webapp_lc_name" {
  value = "${aws_launch_configuration.lc.name}"
}
