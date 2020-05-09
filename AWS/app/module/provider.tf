provider "aws" {
  region  = "${var.region}"
  version = "2.59"
}

terraform {
  required_version = "0.11.14"
}


