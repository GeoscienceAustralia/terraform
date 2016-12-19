# Create our bucket
resource "aws_s3_bucket" "static_www" {
    bucket  = "${var.bucket_name}"
    acl     = "private"
    tags {
      owner = "${var.owner}"
    }
}

# Add a file to the bucket
resource "aws_s3_bucket_object" "index" {
    bucket = "${var.bucket_name}"
    key    = "index.html"
    # this is being run from main.tf
    source = "./s3/index.html"

}