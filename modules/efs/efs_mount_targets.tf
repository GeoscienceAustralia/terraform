resource "aws_efs_mount_target" "efs_mount_target" {
  count           = "${length(var.availability_zones)}"
  file_system_id  = "${aws_efs_file_system.efs.id}"
  subnet_id       = "${var.private_subnet_ids[count.index]}"
  security_groups = ["${aws_security_group.mount_target_sg.id}"]
}

resource "aws_security_group" "mount_target_sg" {
  name        = "inbound_nfs"
  description = "Allow NFS (EFS) access inbound"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"

    # TODO: Set this to the ASG's security group, rather than the VPC's cidr block
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags {
    Name        = "inbound_nfs"
    managed_by  = "Terraform"
    owner       = "${var.owner}"
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
  }
}
