// VPC

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "jumpbox_ip" {
  value = "${aws_eip.jump.public_ip}"
}

// Subnets

output "public_subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "private_subnet_ids" {
  value = ["${aws_subnet.private.*.id}"]
}

// App Security Groups

output "app_http_inbound_sg_id" {
  value = "${aws_security_group.app_http_inbound_sg.id}"
}

output "app_ssh_inbound_sg_id" {
  value = "${aws_security_group.app_ssh_inbound_sg.id}"
}

output "app_outbound_sg_id" {
  value = "${aws_security_group.app_outbound_sg.id}"
}

// ELB Security Groups

output "elb_http_inbound_sg_id" {
  value = "${aws_security_group.elb_http_inbound_sg.id}"
}

output "elb_https_inbound_sg_id" {
  value = "${aws_security_group.elb_https_inbound_sg.id}"
}

output "elb_outbound_sg_id" {
  value = "${aws_security_group.elb_outbound_sg.id}"
}

// Jumpbox Security Groups

output "ssh_from_jump_sg_id" {
  value = "${aws_security_group.ssh_from_jump_sg.id}"
}
