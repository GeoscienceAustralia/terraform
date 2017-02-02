# Create our bucket
resource "aws_s3_bucket" "static_www" {
  bucket = "${var.bucket_name}"
  acl    = "private"

  policy = <<EOF
{
   "Version":"2012-10-17",
   "Id":"PolicyForCloudFrontPrivateContent",
   "Statement":[
     {
       "Sid":" Grant a CloudFront Origin Identity access to support private content",
       "Effect":"Allow",
       "Principal":{"CanonicalUser":"${var.s3_canonical_user_id}"},
       "Action":"s3:GetObject",
       "Resource":"arn:aws:s3:::${var.bucket_name}/*"
     }
   ]
}
EOF

  tags {
    owner = "${var.owner}"
  }
}

# Add a file to the bucket
resource "aws_s3_bucket_object" "index" {
  bucket = "${aws_s3_bucket.static_www.id}"
  key    = "index.html"

  # this is being run from main.tf
  source       = "./s3/index.html"
  content_type = "text/html"
}
