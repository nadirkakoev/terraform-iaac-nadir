output "name" {
  value = "nadir"
}

              #won't work untill terraform apply

output "lastname" {
  value = "kakoev"
}

resource "aws_key_pair" "eu-west-2-key2" {
  key_name   = "nadir_bastion_key2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

}

output "keyname" {
  value = "${aws_key_pair.eu-west-2-key2.key_name}"

}

output "actual_key" {
  value =  "${aws_key_pair.eu-west-2-key2.public_key}"
}

output "actual_key_id" {
  value = "${aws_key_pair.eu-west-2-key2.id}"
}

resource "aws_instance" "web" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
output "instance_id" {
  value = "${aws_instance.web.id}"
}
output "instance_arn" {
  value = "${aws_instance.web.arn}"
}
output "instance_ip" {
  value = "${aws_instance.web.public_ip}"
}
output "instance_dn" {
  value = "${aws_instance.web.public_dns}"
}
output "instance_az" {
  value = "${aws_instance.web.availability_zone}"
}