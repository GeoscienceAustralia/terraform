output "vpc_id" {
    value = "${aws_vpc.vpc.id}"
}

output "nat_eip" {
    value = "${aws_eip.nat.0.private_ip}"
}