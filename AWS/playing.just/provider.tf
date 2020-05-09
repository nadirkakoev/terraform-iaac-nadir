provider "aws" {
  region  = "us-east-2"
  version = "2.59"      //hardcoded ,outofconflict
}

resource "aws_instance" "review_class_instance" {
  //count         = 2
  ami             = "ami-0f7919c33c90f5b58"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.review_class_key.key_name}"    // interpolation
  security_groups = ["${aws_security_group.review_class_sg.name}"] # interpolation 
  user_data       = "${file("wordpress.sh")}"                      // interpolation

  // ["yum install httpd  -y"," systemctl start httpd","systemctl enable httpd"]   regular
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
    cidr_blocks = ["0.0.0.0/0"]
  }
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
}

resource "aws_route53_record" "elina" {
  zone_id = "Z02917502SOB5R24QHEPG"
  name    = "elina.kakoev.com"
  type    = "A"
  ttl     = "10"
  records = ["${aws_instance.review_class_instance.public_ip}"] //  ,[] for multiple
}


output "public_ip" {
  value = "${aws_instance.review_class_instance.public_ip}"     // * to specify all if you want to put before publi_ip
}
