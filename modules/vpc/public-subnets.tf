
resource "aws_subnet" "public" {
    count = "${length(var.availability_zones)}"
	vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${element(var.public_subnet_cidr, count.index)}"
    availability_zone = "${lookup(var.availability_zones, count.index)}"

	tags {
		Name  = "${var.stack_name}-public-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
        owner = "${var.owner}"
	}
}

resource "aws_route_table" "public" {
    count = "${length(var.availability_zones)}"
	vpc_id = "${aws_vpc.vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.default.id}"
	}

	tags {
		Name        = "${var.stack_name}-public-subnet-${var.environment}-${lookup(var.availability_zones, count.index)}"
        owner = "${var.owner}"
	}
}

resource "aws_route_table_association" "public" {
    count = "${length(var.availability_zones)}"
	subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}
