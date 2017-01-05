resource "aws_instance" "jumpbox" {
    count = "${var.enable_jumpbox}"

    ami = "${lookup(var.jump_amis, var.region)}"
    instance_type = "${var.jump_instance_type}"
    tags = {
        Name = "${var.stack_name}-jumpbox",
        owner = "${var.owner}"
    }
    subnet_id = "${aws_subnet.public.0.id}"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.jump_ssh_sg.id}"]
    key_name = "${var.key_name}"
}

resource "aws_eip" "jump" {
    count = "${var.enable_jumpbox}"

    instance = "${aws_instance.jumpbox.id}"
    vpc = true
}
