provider "aws" {
  region     = "ap-southeast-2"
}

resource "aws_instance" "www" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 80 &
              EOF
  tags {
      owner = "tara.form@ga.gov.au"
      Name = "www-example"
  }
}
