variable "region" {
  default = "ap-southeast-2"
}

variable "stack_name" {
    default = "teststack"
}

variable "owner" {
  default = "autobots@ga.gov.au"
}

variable "availability_zones" {
  default = {
      "0" = "ap-southeast-2a"
      "1" = "ap-southeast-2b"
      "2" = "ap-southeast-2c"
  }
}

variable "key_name" {
    default = "pipeline"
}
