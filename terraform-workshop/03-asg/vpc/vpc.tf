resource "aws_vpc" "vpc" {
    cidr_block                  = "${var.vpc_cidr}"
    enable_dns_support          = true
    enable_dns_hostnames        = true

    tags {
        Name = "${var.stack_name}-vpc",
        owner = "${var.owner}"
        stack_name              = "${var.stack_name}"
        environment             = "${var.environment}"
        created_by              = "terraform"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id                      = "${aws_vpc.vpc.id}"
    tags {
        Name                    = "${var.stack_name}-vpc",
        owner                   = "${var.owner}"
        stack_name              = "${var.stack_name}"
        environment             = "${var.environment}"
        created_by              = "terraform"
    }
}

resource "aws_nat_gateway" "nat" {
    count                      = "${var.nat_gw_count}"
    allocation_id              = "${element(aws_eip.nat.*.id, count.index)}"
    subnet_id                  = "${element(aws_subnet.public.*.id, count.index)}"
}

resource "aws_eip" "nat" {
    count                      = "${var.nat_gw_count}"
  vpc                          = true
}
