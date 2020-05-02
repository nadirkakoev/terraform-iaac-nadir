variable "vpc_cidr" {}

variable "region" {}

variable "private_cidr1" {}
variable "private_cidr2" {}
variable "private_cidr3" {}

variable "public_cidr1" {}
variable "public_cidr2" {}
variable "public_cidr3" {}

//variable "az1" {}
//variable "az2" {}
//variable "az3" {}

//variable "az4" {}
//variable "az5" {}
//variable "az6" {}

variable "tags" {
  type = "map"
}


//variable "allocation_id" {}

variable "ami_task"  {}