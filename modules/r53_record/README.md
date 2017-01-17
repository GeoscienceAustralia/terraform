# RDS Module

## Creates the following resources:

 * Route53 zone
 * Route53 record (private)

### Inputs
* dns_name 

   The prefix of your record, the 'xxx' part of xxx.local

* target_hosted_zone_id 

   The zone of the target, this will need to be pulled from the target itself only required in an alias route type

* target 

   Either an IP (if using simple) or a dns entry (if using alias)

* record_type 

   Options are "s" or "a" for simple and alias respectively, any characters bar the first will be ignored.
   therefore "simple" and "alias" are also valid

* r53_zone_id 
   The zone_id of your route53_zone, usually created with the r53_zone module

### Outputs

* simple_fqdn

   The FQDN of a record created with the record_type "simple"

* alias_fqdn
  
  The FQDN of a record created with the record_type "alias"

## Examples
### Simple example
```
module "route53" {
  source = "github.com/GeoscienceAustralia/cloud-examples//modules/route53?ref=master"
  dns_name = "www.example.com"
  r53_zone_id = "${module.r53_zone.zone_id}"
  target = "${module.eip.public_ip}"
  record_type = "simple"
}
```

### Alias example
```
module "route53" {
  source = "github.com/GeoscienceAustralia/cloud-examples//modules/route53?ref=master"
  dns_name = "www.example.com"
  r53_zone_id = "${module.r53_zone.zone_id}"
  target_hosted_zone_id = "${module.asg.elb_dns_hosted_zone}"
  target = "${module.asg.elb_dns_name}"
  record_type = "alias"
}
```