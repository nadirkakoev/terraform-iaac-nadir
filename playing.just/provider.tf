provider "aws" {
    region = "us-east-2"

}    



resource "aws_key_pair" "review_class_key" {
  key_name   = "nadir_bastion_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}  

resource "aws_security_group" "review_class_sg" {
  name        = "review_class"
  description = "Allow TLS inbound traffic"
  //vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = 0.0.0.0/0
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = 0.0.0.0/0
  }
  
  
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = 0.0.0.0/0
  }
  
  
  
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }