output "domain_name" {
  value = "${aws_cloudfront_distribution.www.domain_name}"
}

output "s3_canonical_user_id" {
  value = "${aws_cloudfront_origin_access_identity.origin_access_identity.s3_canonical_user_id}"
}
