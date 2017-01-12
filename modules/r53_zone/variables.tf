//
// From other modules
//

variable "zone" {}

variable "stack_name" {}

variable "environment" {}

variable "owner" {}

# Only need a vpc_id if private
variable "vpc_id" {
  default = "placeholder"
}

variable "is_public" {
  default = false
}
