variable "region" {
  default     = "ap-southeast-2"
}

variable "stack_name" {
  default     = "3tiertest"
}

variable "owner" {
  default     = "autobots@ga.gov.au"
}

variable "environment" {
  default     = "dev"
}

variable "availability_zones" {
  default = {
      "0"     = "ap-southeast-2a"
      "1"     = "ap-southeast-2b"
      "2"     = "ap-southeast-2c"
  }
}

variable "key_name" {
  default     = "INSERT_YOUR_KEYPAIR_HERE"
}

// RDS Variables

variable "db_name" {
  default     = "mydb"
}

variable "username" {
  default     = "dbadmin"
}

variable "password" {
  default     = "password123!"
}

variable "rds_is_multi_az" {
  default     = "false"
}
