provider "aws" {
  region     = "ap-southeast-2"
}

resource "aws_instance" "www" {
  ami           = "ami-4d3b062e"
  instance_type = "t2.micro"
}
