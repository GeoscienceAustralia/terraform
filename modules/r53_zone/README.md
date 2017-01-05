# RDS Module

## Creates the following resources:

 * Route53 zone (private)

### Inputs
* zone 

   The suffix of your record, the 'xxx' part of database.xxx

* stack_name 

   This will be used to tag your zone

* owner 

   The value of the 'owner' tag applied to the zone

   This should be a group email address

* vpc_id 

   The id of the vpc most likely this will be `${module.vpc.vpc_id}`

### Outputs

* zone_id

   The zone id of the route 53 zone, to be used with r53_record module

## Examples
```
module "r53_zone" {
  source = "github.com/GeoscienceAustralia/cloud-examples//modules/routr53_zonee53?ref=master"
  zone = "${var.stack_name}"
  stack_name = "${var.stack_name}"
  owner = "${var.owner}"
  vpc_id = "${module.vpc.vpc_id}"
}
```