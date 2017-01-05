resource "aws_route53_record" "alias_route" {
    # if record_type.beginsWith("a")
    count = "${replace(replace(var.record_type, "/^[^a].*/", "0"), "/^a.*$/", "1")}"
    zone_id = "${var.r53_zone_id}"
    name = "${var.dns_name}"
    type = "A"

    alias {
        name = "${var.target}"
        zone_id = "${var.target_hosted_zone_id}"
        evaluate_target_health = true
    }
}