resource "aws_subnet" "private" {
    count = "${length(var.availability_zones)}"
	vpc_id            = "${aws_vpc.vpc.id}"

    cidr_block = "${element(var.private_subnet_cidr, count.index)}"
    availability_zone = "${lookup(var.availability_zones, count.index)}"

	tags {
		Name  = "${var.stack_name}-private-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
        owner = "${var.owner}"
	}
}

resource "aws_route_table" "private" {
    count = "${length(var.availability_zones)}"
	vpc_id = "${aws_vpc.vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
        gateway_id = "${element(aws_nat_gateway.nat.*.id, count.index)}"
	}

	tags {
		Name  = "${var.stack_name}-private-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
        owner = "${var.owner}"
	}
}

resource "aws_route_table_association" "private" {
    count = "${length(var.availability_zones)}"
	subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
