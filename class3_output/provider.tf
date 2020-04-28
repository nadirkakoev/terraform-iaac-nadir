provider "aws" {
  region  = "us-east-1"
  version = "2.59"      //hard coded   "~> 2.59" or more 
}

resource "aws_instance" "web-output" {
  ami = "ami-0323c3dd2da7fb37d" // create instance

  key_name = "${aws_key_pair.us-east-1-key-output.key_name }"
  
   security_groups  = ["${aws_security_group.allow_tls.name}"]

  instance_type = "t2.micro"
}

resource "aws_key_pair" "us-east-1-key-output" {
  key_name   = "nadir_bastion_output"         //create key
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"                 // security group
  description = "Allow TLS inbound traffic"

  //vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}


resource "aws_route53_record" "www" {
  zone_id = "Z02917502SOB5R24QHEPG"
  name    = "www.kakoev.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web-output.public_ip}"]
}


output "MESSAGE" {
  value = "Login to wordpress and reset passwd!!!"
}


output "key_pair_attached_to the instance" {
  value = "${aws_key_pair.us-east-1-key-output.key_name }"
}

output "instance_ID" {
  value = "${aws_instance.web-output.id}"
}

output "instance_ARN" {
  value = "${aws_instance.web-output.arn}"
}

output "instance_IP" {
  value = "${aws_instance.web-output.public_ip}"
}


output "instance_DNS" {
  value = "${aws_instance.web-output.public_dns}"
}




