provider "aws" {
  region  = "us-east-1"
  version = "2.59"          //hard coded   "~> 2.59" or more 
}

terraform {
  required_version = "0.11.14"
}
