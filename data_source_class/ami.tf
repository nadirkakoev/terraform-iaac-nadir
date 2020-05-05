provider "aws" {
  region  = "us-east-1"
  version = "2.59"      //hard coded   "~> 2.59" or more 
}

terraform {
  required_version = "0.11.14"
}

//data "aws_ami" "ubuntu" {
//most_recent = true                   // find  latest one =true    or   false
//}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "centos" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
}

output "ami" {
  value = "${data.aws_ami.ubuntu.id}"
}

output "centos" {
  value = "${data.aws_ami.centos.id}"
}
