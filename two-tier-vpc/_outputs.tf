output "elb_dns_name" {
  value                  = "${module.asg.elb_dns_name}"
}

output "jumpbox_ip" {
  value                  = "${module.vpc.jumpbox_ip}"
}
