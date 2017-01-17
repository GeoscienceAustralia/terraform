# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file
# except in compliance with the License. A copy of the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed on an "AS IS"
# BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under the License.
resource "aws_security_group" "elb_http_inbound_sg" {
# Allow HTTP from anywhere
  name                        = "elb_http_inbound"
  ingress {
    from_port                 = 80
    to_port                   = 80
    protocol                  = "tcp"
    cidr_blocks               = ["0.0.0.0/0"]
  }
  egress {
    from_port                 = 0
    to_port                   = 0
    protocol                  = "-1"
    cidr_blocks               = ["0.0.0.0/0"]
  }
  vpc_id                      = "${aws_vpc.vpc.id}"
  tags {
      Name                    = "${var.stack_name}_elb_http_inbound",
      owner                   = "${var.owner}"
      stack_name              = "${var.stack_name}"
      environment             = "${var.environment}"
      created_by              = "terraform"
  }
}

resource "aws_security_group" "elb_https_inbound_sg" {
# Allow HTTPS from anywhere
  name                        = "elb_https_inbound"
  ingress {
    from_port                 = 443
    to_port                   = 443
    protocol                  = "tcp"
    cidr_blocks               = ["0.0.0.0/0"]
  }
  egress {
    from_port                 = 0
    to_port                   = 0
    protocol                  = "-1"
    cidr_blocks               = ["0.0.0.0/0"]
  }
  vpc_id                      = "${aws_vpc.vpc.id}"
  tags {
      Name                    = "${var.stack_name}_elb_https_inbound",
      owner                   = "${var.owner}"
      stack_name              = "${var.stack_name}"
      environment             = "${var.environment}"
      created_by              = "terraform"
  }
}

resource "aws_security_group" "elb_outbound_sg" {
# Allow outbound connections
  name                        = "elb_outbound"
  egress {
    from_port                 = 0
    to_port                   = 0
    protocol                  = "-1"
    cidr_blocks               = ["0.0.0.0/0"]
  }
  vpc_id                      = "${aws_vpc.vpc.id}"
  tags {
      Name                    = "${var.stack_name}_elb_outbound"
      owner                   = "${var.owner}"
      stack_name              = "${var.stack_name}"
      environment             = "${var.environment}"
      created_by              = "terraform"
  }
}
