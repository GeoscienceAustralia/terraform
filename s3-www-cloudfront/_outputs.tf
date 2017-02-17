output "domain_name" {
  value = "http://${module.cloudfront_distribution.domain_name}"
}
