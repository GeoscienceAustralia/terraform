resource "aws_route53_zone" "private" {
    name = "private"
    vpc_id = "${var.vpc_id}"
}
resource "aws_route53_record" "database" {
    zone_id = "${aws_route53_zone.private.zone_id}"
    name = "database.local"
    type = "A"

    alias {
        name = "${var.database_address}"
        zone_id = "${var.database_hosted_zone_id}"
        evaluate_target_health = true
    }
}