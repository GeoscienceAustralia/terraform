output "simple_fqdn" {
    value = "${aws_route53_record.simple.fqdn}"
}

output "alias_fqdn" {
    value = "${aws_route53_record.alias_route.fqdn}"
}