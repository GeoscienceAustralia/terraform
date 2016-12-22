
resource "aws_subnet" "ap-southeast-2-public" {
    count = "${length(var.availability_zones)}"
	vpc_id            = "${aws_vpc.vpc.id}"

    cidr_block = "${element(var.public_subnet_cidr, count.index)}"
    availability_zone = "${lookup(var.availability_zones, count.index)}"

	tags {
		Name        = "public-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
		Environment = "${var.environment}"
	}
}

resource "aws_route_table" "ap-southeast-2-public" {
    count = "${length(var.availability_zones)}"
	vpc_id = "${aws_vpc.vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.default.id}"
	}

	tags {
		Name        = "public-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
		Environment = "${var.environment}"
	}
}

resource "aws_route_table_association" "ap-southeast-2-public" {
    count = "${length(var.availability_zones)}"
	subnet_id      = "${element(aws_subnet.ap-southeast-2-public.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.ap-southeast-2-public.*.id, count.index)}"
}
