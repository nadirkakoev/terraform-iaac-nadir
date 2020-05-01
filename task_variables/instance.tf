resource "aws_instance" "task_2" {
  //count         = 2
  ami             = "ami-00077e3fed5089981"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.my_task.key_name}"   // interpolation
  security_groups = ["${aws_security_group.task2.name}"] # interpolation 
  user_data       = "${file("wordpress.sh")}"            // interpolation

  tags = "${var.tags}"
}
