

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "name"
    values = ["CentOS Linux 6 x86_64 HVM EBS *"]
  }

}

resource "aws_key_pair" "eu-west-3-key" {
  key_name   = "Nadir_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "nadir-project" {
  name        = "project"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.nagios.id}"
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

  ingress {
    description = "TLS from VPC"
    from_port   =-1
    to_port     =-1 
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nadir_security_groupt"
  }
}

resource "aws_instance" "nagios" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.medium"
  key_name      = "${aws_key_pair.eu-west-3-key.key_name}" //public
  vpc_security_group_ids = ["${aws_security_group.nadir-project.id}"] 
  subnet_id  = "${aws_subnet.public1.id}"
  associate_public_ip_address = "true"
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = "${file("~/.ssh/id_rsa")}" // private
      host        = "${self.public_ip}"        // self public inside one 
    }

    inline = [
      "sudo yum install curl -y ",
      "sudo curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sudo sh"
    ]
  }
}

output "Project Name" {
  value = ["${var.project}"]
  }



output "Nagios username" {
  sensitive = false
  value = ["${var.username}"]
}


output "Nagios Password" {
  sensitive = true
  value = ["${var.secret_password}"]
}








