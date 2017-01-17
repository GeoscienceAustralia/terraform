resource "aws_route53_record" "simple" {
  # if record_type.beginsWith("s")
  count                    = "${replace(replace(var.record_type, "/^[^s].*/", "0"), "/^s.*$/", "1")}"
  zone_id                  = "${var.r53_zone_id}"
  name                     = "${var.dns_name}"
  type                     = "A"
  ttl                      = "${var.ttl}"
  records                  = ["${var.target}"]
}
