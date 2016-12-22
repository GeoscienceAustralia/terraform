provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "dedicated"
    enable_dns_support  = true
    enable_dns_hostnames  = true

    tags {
        Name = "example-multiaz"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_nat_gateway" "nat" {
    count = "${length(var.availability_zones)}"
    /*count = "${element(var.availability_zones, count.index)}"*/
    allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
    subnet_id = "${element(aws_subnet.ap-southeast-2-public.*.id, count.index)}"
    depends_on = ["aws_internet_gateway.default"]
}

resource "aws_eip" "nat" {
  count = "${length(var.availability_zones)}"
  vpc = true
}
