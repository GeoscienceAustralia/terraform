//
// Module: RDS
//

// RDS instance variables

variable "identifier" {
  default          = "mydb-rds"
  description      = "Identifier for your DB"
}

variable "storage" {
  default          = "10"
  description      = "Storage size in GB"
}

variable "engine" {
  default          = "postgres"
  description      = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description      = "Engine version"

  default = {
    mysql          = "5.6.22"
    postgres       = "9.4.1"
  }
}

variable "instance_class" {
  default          = "db.t2.micro"
  description      = "Instance class"
}

variable "db_name" {
  default          = "mydb"
  description      = "db name"
}

variable "username" {
  default          = "myuser"
  description      = "User name"
}

variable "password" {
  description      = "password, provide through your ENV variables"
  default          = "Password123"
}

variable "rds_is_multi_az" {
  default          = "false"
}

variable "cidr_blocks" {
  default          = "0.0.0.0/0"
  description      = "CIDR for sg"
}

variable "sg_name" {
  default          = "rds_sg"
  description      = "Tag Name for sg"
}

// Variables from other modules

variable "private_subnet_ids" {
  type             = "list"
}

// Variables for providers used in this module

variable "stack_name" {}

variable "environment" {}

variable "owner" {}

variable "vpc_id" {}
