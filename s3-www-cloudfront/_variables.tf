data "aws_caller_identity" "current" {}

variable "region" {
  default     = "ap-southeast-2"
  description = "The region you want to deploy in"
}

variable "bucket_name" {
  default     = "ga-tf-s3cfexample"
  description = "The name of the s3 bucket to deploy"
}

variable "owner" {
  default     = "ga.autobots@gmail.com"
  description = "The owner email, this will be applied as a tag to objects"
}
