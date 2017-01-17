output "database_address" {
  value = "${aws_db_instance.rds.address}"
}

output "database_hosted_zone_id" {
  value = "${aws_db_instance.rds.hosted_zone_id}"
}
