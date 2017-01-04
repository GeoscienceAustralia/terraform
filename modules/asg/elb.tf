resource "aws_elb" "elb" {
  name = "${var.stack_name}-elb"
  subnets = ["${var.public_subnet_ids}"]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 30
    target = "HTTP:80/"
    interval = 60
  }
  security_groups = [
    "${var.http_inbound_sg_id}",
    "${var.https_inbound_sg_id}"
  ]
  tags {
    Name = "${var.stack_name}_elb",
    owner = "${var.owner}"
  }
}
