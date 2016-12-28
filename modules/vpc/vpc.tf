resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_support  = true
    enable_dns_hostnames  = true

    tags {
        Name = "${var.stack_name}-vpc",
        owner = "${var.owner}"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_nat_gateway" "nat" {
    count = "${var.nat_gw_count}"
    allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
    subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
    depends_on = ["aws_internet_gateway.default"]
}

resource "aws_eip" "nat" {
  count = "${length(var.availability_zones)}"
  vpc = true
}
