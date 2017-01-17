output "zone_id" {
  value = "${aws_route53_zone.zone.zone_id}"
}

output "public_zone_id" {
  value = "${aws_route53_zone.public_zone.zone_id}"
}
