variable "ttl" {
    default = "300"
}
// Only used in alias, we add a default so simple doesn't have to specify zone
variable "target_hosted_zone_id" {
    default = "placeholder"
}
//
// From other modules
//
variable "dns_name" {}
variable "target" {}
variable "r53_zone_id" {}
variable "record_type" {}