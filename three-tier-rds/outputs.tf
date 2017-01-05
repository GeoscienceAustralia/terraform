output "elb_dns_name" {
  value = "${module.asg.elb_dns_name}"
}

output "rds_endpoint" {
  value = "${module.rds.database_address}"
}

output "jumpbox_ip" {
  value = "${module.vpc.jumpbox_ip}"
}

output "database_fqdn" {
    value = "${module.r53_record_db.alias_fqdn}"
}
