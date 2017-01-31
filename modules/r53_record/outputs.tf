output "fqdn" {
  value = "${aws_route53_record.simple.fqdn}"
}

output "alias_fqdn" {
  value = "${aws_route53_record.alias_route.fqdn}"
}

output "failover_fqdn" {
  value = "${aws_route53_record.failover_alias_route.fqdn}"
}
