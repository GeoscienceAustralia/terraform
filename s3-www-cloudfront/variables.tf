data "aws_caller_identity" "current" {}

variable "region" {
    default = "ap-southeast-2"
    description = "The region you want to deploy in"
}
variable "bucket_name" {
    default = "o12764qwjhflwjeytf7asdbucket-mc-bucketface"
    description = "The name of the s3 bucket to deploy"
}
variable "owner" { 
    default = "ga.autobots@gmail.com"
    description = "The owner email, this will be applied as a tag to objects"
}
variable "origin_id" {
    default = "wwwS3Origin"
    description = "The origin ID to be applied to the cloudfront distribution"
}