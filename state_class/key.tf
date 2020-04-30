resource "aws_key_pair" "us-east-1-key" {
  key_name   = "nadir_state_class"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}




