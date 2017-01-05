resource "aws_launch_configuration" "lc" {
  lifecycle { create_before_destroy = true }
  image_id = "${lookup(var.asg_amis, var.region)}"
  instance_type = "${var.instance_type}"
  security_groups = [
    "${var.http_inbound_sg_id}",
    "${var.https_inbound_sg_id}",
    "${var.app_ssh_inbound_sg_id}",
    "${var.outbound_sg_id}"
  ]
  user_data = "${file("./userdata.sh")}"
  key_name = "${var.key_name}"
  associate_public_ip_address = true
}
