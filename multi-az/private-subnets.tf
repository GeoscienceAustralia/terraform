
resource "aws_subnet" "ap-southeast-2-private" {
    count = "${length(var.availability_zones)}"
	vpc_id            = "${aws_vpc.vpc.id}"

    cidr_block = "${element(var.private_subnet_cidr, count.index)}"
    availability_zone = "${lookup(var.availability_zones, count.index)}"

	tags {
		Name        = "private-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
		Environment = "${var.environment}"
	}
}

resource "aws_route_table" "ap-southeast-2-private" {
    count = "${length(var.availability_zones)}"
	vpc_id = "${aws_vpc.vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
        gateway_id = "${element(aws_nat_gateway.nat.*.id, count.index)}"
	}

	tags {
		Name        = "private-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
		Environment = "${var.environment}"
	}
}

resource "aws_route_table_association" "ap-southeast-2-private" {
    count = "${length(var.availability_zones)}"
	subnet_id      = "${element(aws_subnet.ap-southeast-2-private.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.ap-southeast-2-private.*.id, count.index)}"
}
