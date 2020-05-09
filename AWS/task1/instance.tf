




resource "aws_instance" "web" {
  ami           = "ami-0d6621c01e8c2de2c"
  instance_type = "t2.large"

  key_name = "${aws_key_pair.us-west-2-key.key_name}" #INTERPOLATION ,VARIABLES

  security_groups = ["${aws_security_group.ssh.name}", "${aws_security_group.web.name}"] #INTERPOLATION ,VARIABLES

  tags = {
    Name = "terraform ec2"
  }
  availability_zone = "us-west-2c"
  user_data = <<-EOF
		#! /bin/bash
    yum install httpd -y
    systemctl restart httpd
    systemctl enable httpd
    wget https://www.free-css.com/assets/files/free-css-templates/download/page251/flame.zip
    unzip flame.zip
    mv flameonepage/*  /var/www/html/

   
    
  EOF
}



