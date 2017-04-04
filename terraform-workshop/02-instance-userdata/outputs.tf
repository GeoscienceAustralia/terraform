output "publc_dns" {
  value = "${aws_instance.www.public_dns}"
}
