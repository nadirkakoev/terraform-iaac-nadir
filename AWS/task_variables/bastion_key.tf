resource "aws_key_pair" "my_task" {
  key_name   = "nadir_bastion_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_vpc_peering_connection" "test_connection" {
  # (resource arguments)
}
